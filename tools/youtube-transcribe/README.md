# YouTube Transcribe Tool

A command-line tool that downloads YouTube videos and transcribes them using OpenAI's Whisper, then saves the transcripts to your knowledge base.

## Quick Start

1. **Install dependencies** (one-time setup):
   ```bash
   # Install Python packages
   pip install yt-dlp openai-whisper

   # Install ffmpeg (required for audio processing)
   # On macOS:
   brew install ffmpeg
   # On Ubuntu/Debian:
   sudo apt update && sudo apt install ffmpeg
   ```

2. **Transcribe a YouTube video**:
   ```bash
   ./yt https://www.youtube.com/watch?v=VIDEO_ID
   ```

3. **Configure settings** (optional):
   ```bash
   ./yt --setup
   ```

## Features

- 🎬 Downloads audio from any YouTube video
- 🎙️ Transcribes using OpenAI's Whisper (offline, no API needed)
- 📁 Interactive prompt for organizing in knowledge base
- 📝 Formatted markdown output with metadata
- ⏱️ Preserves timestamps in separate VTT file
- 🎵 Optional audio file retention

## Usage Examples

```bash
# Basic usage - transcribe a single video
./yt https://www.youtube.com/watch?v=dQw4w9WgXcQ

# Use a specific Whisper model (tiny, base, small, medium, large, turbo)
./yt https://www.youtube.com/watch?v=VIDEO_ID --model medium

# Keep the audio file after transcription
./yt https://www.youtube.com/watch?v=VIDEO_ID --keep-audio

# Run setup to change default settings
./yt --setup
```

## How It Works

1. **Download**: Uses yt-dlp to extract audio from YouTube
2. **Transcribe**: Processes audio through Whisper locally
3. **Organize**: Prompts you for where to save in knowledge base
4. **Format**: Creates clean markdown with metadata and transcript

## Output Structure

The tool creates organized folders in your knowledge base:

```
knowledge/
└── Pieces/Podcasts/
    └── Video Title Here/
        ├── transcript.md     # Main transcript with metadata
        ├── timestamps.vtt    # WebVTT file with timecodes
        └── audio.mp3        # Original audio (if --keep-audio)
```

## Transcript Format

Each transcript includes:
- Video title, channel, and upload date
- Original YouTube URL
- Transcription date
- Full transcript text
- Attribution to Whisper model used

## Configuration

The tool stores settings in `.yt_config.json`:

- `whisper_model`: Model size (default: "base")
  - `tiny`: Fastest, least accurate (39M parameters)
  - `base`: Good balance (74M)
  - `small`: Better accuracy (244M)
  - `medium`: Even better (769M)
  - `large`: Best accuracy (1550M)
  - `turbo`: Optimized large model, faster

- `keep_audio`: Whether to save audio files (default: false)
- `audio_format`: Audio format for downloads (default: "mp3")

## Tips

1. **Model Selection**: 
   - Use `tiny` or `base` for quick drafts
   - Use `small` or `medium` for most content
   - Use `large` for important/technical content

2. **Organization**:
   - Follow existing knowledge base structure
   - Create logical categories (e.g., "Pieces/Interviews/", "Books/Talks/")
   - Use consistent naming patterns

3. **Performance**:
   - Transcription time ≈ 1-5x video length (depends on model)
   - Uses GPU automatically if available (much faster)
   - Close other apps for faster processing

## Troubleshooting

**"Missing required dependencies"**
- Install missing packages as shown in error message

**"Download failed"**
- Check if video is private or age-restricted
- Ensure you have internet connection
- Try updating yt-dlp: `pip install -U yt-dlp`

**"Transcription failed"**
- Ensure you have enough disk space
- Check ffmpeg is properly installed
- Try a smaller Whisper model

**Slow transcription**
- Use a smaller model (tiny or base)
- Ensure no other heavy processes running
- Consider GPU acceleration (automatic if available)

## Privacy & Usage Notes

- All processing happens locally on your machine
- No data is sent to external servers (except downloading from YouTube)
- Respect content creators' rights and YouTube's Terms of Service
- For personal use and research purposes

## Technical Details

- **yt-dlp**: Actively maintained YouTube downloader
- **Whisper**: OpenAI's open-source speech recognition model
- **FFmpeg**: Audio/video processing library
- Works on macOS, Linux, and Windows (with appropriate setup)