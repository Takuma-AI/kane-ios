#!/usr/bin/env python3
"""
YouTube video downloader and transcriber tool.
Downloads videos using yt-dlp and transcribes them using OpenAI's Whisper.
"""

import sys
import os
import json
import argparse
import subprocess
import tempfile
from pathlib import Path
from datetime import datetime
import re

CONFIG_FILE = os.path.join(os.path.dirname(__file__), '.yt_config.json')

class YouTubeTranscriber:
    def __init__(self):
        self.config = self.load_config()
        self.project_root = Path(__file__).parent.parent.parent
        self.knowledge_base = self.project_root / "knowledge"
        
    def load_config(self):
        """Load configuration from file or return default config"""
        if os.path.exists(CONFIG_FILE):
            with open(CONFIG_FILE, 'r') as f:
                return json.load(f)
        return {
            'whisper_model': 'base',
            'default_category': 'Pieces',
            'keep_audio': False,
            'audio_format': 'mp3'
        }
    
    def save_config(self):
        """Save configuration to file"""
        with open(CONFIG_FILE, 'w') as f:
            json.dump(self.config, f, indent=2)
    
    def check_dependencies(self):
        """Check if required dependencies are installed"""
        dependencies = {
            'yt-dlp': 'yt-dlp --version',
            'ffmpeg': 'ffmpeg -version',
            'whisper': 'whisper --help'
        }
        
        missing = []
        for name, check_cmd in dependencies.items():
            try:
                subprocess.run(check_cmd.split(), capture_output=True, check=True)
            except (subprocess.CalledProcessError, FileNotFoundError):
                missing.append(name)
        
        if missing:
            print("Missing required dependencies:")
            print("Please install the following:")
            if 'yt-dlp' in missing:
                print("  - yt-dlp: pip install yt-dlp")
            if 'whisper' in missing:
                print("  - whisper: pip install openai-whisper")
            if 'ffmpeg' in missing:
                print("  - ffmpeg: brew install ffmpeg (on macOS)")
            return False
        return True
    
    def download_video(self, url, output_path):
        """Download audio from YouTube video using yt-dlp"""
        print(f"\n📥 Downloading audio from: {url}")
        
        # First get video info
        info_cmd = ['yt-dlp', '--print', 'title', '--print', 'channel', '--print', 'upload_date', '--skip-download', url]
        
        try:
            result = subprocess.run(info_cmd, capture_output=True, text=True, check=True)
            lines = result.stdout.strip().split('\n')
            
            if len(lines) >= 3:
                metadata = {
                    'title': lines[0],
                    'channel': lines[1],
                    'upload_date': lines[2],
                    'url': url
                }
            else:
                metadata = {'title': 'Unknown', 'channel': 'Unknown', 'upload_date': '', 'url': url}
        except subprocess.CalledProcessError as e:
            print(f"✗ Failed to get video info: {e.stderr}")
            metadata = {'title': 'Unknown', 'channel': 'Unknown', 'upload_date': '', 'url': url}
        
        # Now download the audio
        output_file = str(output_path / "audio")
        
        # yt-dlp options for audio extraction
        ydl_opts = [
            'yt-dlp',
            '-x',  # Extract audio
            '--audio-format', self.config['audio_format'],
            '--audio-quality', '0',  # Best quality
            '-o', output_file,  # Output template without extension
            '--no-playlist',  # Don't download playlists by default
            url
        ]
        
        try:
            print("Downloading audio file...")
            subprocess.run(ydl_opts, check=True)
            
            # Check what files were created
            import glob
            audio_files = glob.glob(str(output_path / "audio.*"))
            
            if audio_files:
                filepath = audio_files[0]  # Take the first match
                print(f"✓ Downloaded: {metadata['title']}")
                print(f"   Audio file: {filepath}")
                return filepath, metadata
            else:
                print("✗ No audio file found after download")
                return None, None
                
        except subprocess.CalledProcessError as e:
            print(f"✗ Download failed: {e}")
            return None, None
    
    def transcribe_audio(self, audio_path, output_dir):
        """Transcribe audio file using Whisper"""
        print(f"\n🎙️ Transcribing audio using Whisper ({self.config['whisper_model']} model)...")
        print("This may take a few minutes depending on the length...")
        
        whisper_cmd = [
            'whisper',
            audio_path,
            '--model', self.config['whisper_model'],
            '--output_dir', str(output_dir),
            '--output_format', 'all',  # Generate all formats including txt and vtt
            '--language', 'en',
            '--task', 'transcribe'
        ]
        
        try:
            subprocess.run(whisper_cmd, check=True)
            print("✓ Transcription complete!")
            return True
        except subprocess.CalledProcessError as e:
            print(f"✗ Transcription failed: {e}")
            return False
    
    def format_transcript(self, txt_path, vtt_path, metadata):
        """Format the raw transcript into a nice markdown file"""
        # Read plain text transcript
        with open(txt_path, 'r', encoding='utf-8') as f:
            plain_text = f.read().strip()
        
        # Read VTT for timestamps if needed later
        vtt_content = ""
        if os.path.exists(vtt_path):
            with open(vtt_path, 'r', encoding='utf-8') as f:
                vtt_content = f.read()
        
        # Create formatted markdown
        upload_date = metadata.get('upload_date', '')
        if upload_date and len(upload_date) == 8:
            # Format YYYYMMDD to YYYY-MM-DD
            upload_date = f"{upload_date[:4]}-{upload_date[4:6]}-{upload_date[6:]}"
        
        markdown = f"""# {metadata.get('title', 'Untitled')}

**Channel**: {metadata.get('channel', 'Unknown')}  
**Date**: {upload_date}  
**URL**: {metadata.get('url', '')}  
**Transcribed**: {datetime.now().strftime('%Y-%m-%d')}

---

## Transcript

{plain_text}

---

*Transcribed using OpenAI Whisper ({self.config['whisper_model']} model)*
"""
        
        return markdown
    
    def sanitize_filename(self, filename):
        """Sanitize filename for filesystem"""
        # Remove invalid characters
        filename = re.sub(r'[<>:"/\\|?*]', '', filename)
        # Replace multiple spaces with single space
        filename = re.sub(r'\s+', ' ', filename)
        # Trim length if too long
        if len(filename) > 200:
            filename = filename[:200]
        return filename.strip()
    
    def get_save_location(self, metadata):
        """Interactively get save location from user"""
        print(f"\n📁 Where should I save the transcript?")
        print(f"   Video: {metadata.get('title', 'Unknown')}")
        print(f"   Channel: {metadata.get('channel', 'Unknown')}")
        
        # Show some example paths
        print("\nExamples:")
        print("  - Pieces/Podcasts/")
        print("  - Pieces/Techstars Workshop Recordings/")
        print("  - Books/")
        
        # Get user input
        relative_path = input("\nEnter path within knowledge/ (or press Enter for 'Pieces/'): ").strip()
        if not relative_path:
            relative_path = "Pieces/"
        
        # Ensure it doesn't start with knowledge/ (user might type it)
        if relative_path.startswith("knowledge/"):
            relative_path = relative_path[10:]
        
        # Ensure it ends with /
        if not relative_path.endswith("/"):
            relative_path += "/"
        
        # Create sanitized folder name from title
        folder_name = self.sanitize_filename(metadata.get('title', 'untitled'))
        
        full_path = self.knowledge_base / relative_path / folder_name
        
        # Confirm with user
        print(f"\nWill save to: knowledge/{relative_path}{folder_name}/")
        confirm = input("Confirm? (Y/n): ").strip().lower()
        
        if confirm == 'n':
            return self.get_save_location(metadata)  # Recursive retry
        
        return full_path
    
    def process_video(self, url):
        """Main processing pipeline"""
        if not self.check_dependencies():
            return False
        
        # Create temporary directory for processing
        with tempfile.TemporaryDirectory() as temp_dir:
            temp_path = Path(temp_dir)
            
            # Download video
            audio_file, metadata = self.download_video(url, temp_path)
            if not audio_file:
                return False
            
            # Transcribe
            if not self.transcribe_audio(audio_file, temp_path):
                return False
            
            # Get base filename without extension (should be "audio")
            base_name = Path(audio_file).stem
            txt_file = temp_path / f"{base_name}.txt"
            vtt_file = temp_path / f"{base_name}.vtt"
            
            # Check if transcript files exist
            if not txt_file.exists():
                print(f"✗ Transcript file not found: {txt_file}")
                print("Checking directory contents:")
                for f in temp_path.iterdir():
                    print(f"  - {f.name}")
                return False
            
            # Format transcript
            transcript_content = self.format_transcript(txt_file, vtt_file, metadata)
            
            # Get save location from user
            save_dir = self.get_save_location(metadata)
            
            # Create directory
            save_dir.mkdir(parents=True, exist_ok=True)
            
            # Save transcript
            transcript_path = save_dir / "transcript.md"
            with open(transcript_path, 'w', encoding='utf-8') as f:
                f.write(transcript_content)
            
            # Optionally save audio file
            if self.config.get('keep_audio', False):
                import shutil
                audio_dest = save_dir / f"audio.{self.config['audio_format']}"
                shutil.copy2(audio_file, audio_dest)
                print(f"✓ Saved audio to: {audio_dest}")
            
            # Save VTT file for reference
            if os.path.exists(vtt_file):
                import shutil
                vtt_dest = save_dir / "timestamps.vtt"
                shutil.copy2(vtt_file, vtt_dest)
            
            print(f"\n✅ Success! Transcript saved to:")
            print(f"   {transcript_path}")
            
            return True

def main():
    parser = argparse.ArgumentParser(description='Download and transcribe YouTube videos')
    parser.add_argument('url', nargs='?', help='YouTube video URL')
    parser.add_argument('--setup', action='store_true', help='Run setup/configuration')
    parser.add_argument('--model', choices=['tiny', 'base', 'small', 'medium', 'large', 'turbo'],
                      help='Whisper model size')
    parser.add_argument('--keep-audio', action='store_true', 
                      help='Keep the downloaded audio file')
    
    args = parser.parse_args()
    
    transcriber = YouTubeTranscriber()
    
    if args.setup or not args.url:
        # Run setup
        print("\n=== YouTube Transcriber Setup ===")
        print("\nCurrent configuration:")
        print(f"  Whisper model: {transcriber.config['whisper_model']}")
        print(f"  Keep audio files: {transcriber.config['keep_audio']}")
        print(f"  Audio format: {transcriber.config['audio_format']}")
        
        # Update settings
        print("\nUpdate settings? (press Enter to keep current)")
        
        model = input(f"Whisper model [{transcriber.config['whisper_model']}]: ").strip()
        if model in ['tiny', 'base', 'small', 'medium', 'large', 'turbo']:
            transcriber.config['whisper_model'] = model
        
        keep = input(f"Keep audio files? (y/N) [{transcriber.config['keep_audio']}]: ").strip().lower()
        if keep:
            transcriber.config['keep_audio'] = (keep == 'y')
        
        transcriber.save_config()
        print("\n✓ Configuration saved!")
        
        if not args.url:
            print("\nUsage: yt <youtube-url>")
            return
    
    # Override model if specified
    if args.model:
        transcriber.config['whisper_model'] = args.model
    
    if args.keep_audio:
        transcriber.config['keep_audio'] = True
    
    # Process the video
    transcriber.process_video(args.url)

if __name__ == '__main__':
    main()