import Foundation
import Combine
import AVFoundation
import SwiftUI

// MARK: - Models
struct Quest: Codable, Identifiable {
    let id: String
    let title: String
    let whyMatters: String?
    let createdAt: String
    let status: String
    var isDraft: Bool = true  // New field for draft state
    
    private enum CodingKeys: String, CodingKey {
        case id, title, status
        case whyMatters = "why_matters"
        case createdAt = "created_at"
        case isDraft = "is_draft"
    }
}

struct ServerMessage: Codable {
    let type: String
    let action: String?
    let quest: Quest?
    let deleted: String?
    let audio: String?  // Base64 audio for voice responses
    let text: String?   // Text of what KANE said
}

// MARK: - Kane Server Connection
class KaneServerConnection: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var quests: [Quest] = []
    @Published var isConnected = false
    @Published var connectionStatus = "Disconnected"
    @Published var lastKaneResponse: String?
    
    private var webSocketTask: URLSessionWebSocketTask?
    private let serverURL: String
    private let session: URLSession
    
    // Audio handling
    private let audioEngine = AVAudioEngine()
    private let audioPlayer = AVAudioPlayerNode()
    private let audioSession = AVAudioSession.sharedInstance()
    private var inputNode: AVAudioInputNode?
    private var isStreaming = false
    
    // Audio streaming settings
    private let sampleRate: Double = 16000
    private let channelCount: AVAudioChannelCount = 1
    private let bufferSize: AVAudioFrameCount = 4096
    
    // Audio playback for voice responses
    private var currentAudioPlayer: AVAudioPlayer?
    
    init(serverURL: String = "ws://localhost:8765") {
        self.serverURL = serverURL
        self.session = URLSession(configuration: .default)
        super.init()
        setupAudio()
    }
    
    // MARK: - Connection Management
    func connect() {
        guard let url = URL(string: serverURL) else {
            print("Invalid server URL")
            return
        }
        
        disconnect() // Clean up any existing connection
        
        webSocketTask = session.webSocketTask(with: url)
        webSocketTask?.resume()
        
        isConnected = true
        connectionStatus = "Connected to KANE"
        
        // Start listening for messages
        receiveMessage()
        
        // Send initial handshake
        sendMessage(["type": "ios_client", "version": "1.0"])
    }
    
    func disconnect() {
        stopStreaming() // Clean up audio streaming
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        webSocketTask = nil
        isConnected = false
        connectionStatus = "Disconnected"
    }
    
    // MARK: - Audio Handling
    private func setupAudio() {
        do {
            // Configure audio session for recording and playback
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
            try audioSession.setActive(true)
            
            // Setup playback
            audioEngine.attach(audioPlayer)
            audioEngine.connect(audioPlayer, to: audioEngine.mainMixerNode, format: nil)
            
            // Setup recording
            inputNode = audioEngine.inputNode
            
            try audioEngine.start()
        } catch {
            print("Failed to setup audio: \(error)")
        }
    }
    
    func startStreaming() {
        print("🎤 startStreaming called")
        
        guard let inputNode = inputNode else {
            print("❌ No input node available")
            return
        }
        
        guard !isStreaming else {
            print("⚠️ Already streaming")
            return
        }
        
        // Check if audio engine is running
        if !audioEngine.isRunning {
            print("⚠️ Audio engine not running, attempting to restart...")
            do {
                try audioEngine.start()
                print("✅ Audio engine restarted")
            } catch {
                print("❌ Failed to restart audio engine: \(error)")
                return
            }
        }
        
        // Use the input node's native format instead of forcing our own
        let inputFormat = inputNode.inputFormat(forBus: 0)
        
        // Install tap on input node to capture audio with hardware format
        inputNode.installTap(onBus: 0, bufferSize: bufferSize, format: inputFormat) { [weak self] buffer, time in
            self?.processAudioBuffer(buffer)
        }
        
        isStreaming = true
        print("🎤 Started audio streaming at \(inputFormat.sampleRate)Hz")
    }
    
    func stopStreaming() {
        guard let inputNode = inputNode, isStreaming else { return }
        
        inputNode.removeTap(onBus: 0)
        isStreaming = false
        print("🔴 Stopped audio streaming")
    }
    
    private func processAudioBuffer(_ buffer: AVAudioPCMBuffer) {
        // Handle whatever format we get from hardware
        let frameCount = Int(buffer.frameLength)
        
        if let floatChannelData = buffer.floatChannelData?[0] {
            // Convert float32 to int16 PCM
            var audioData = Data(capacity: frameCount * 2)
            
            for i in 0..<frameCount {
                let sample = max(-1.0, min(1.0, floatChannelData[i]))
                let int16Sample = Int16(sample * 32767)
                withUnsafeBytes(of: int16Sample.littleEndian) { bytes in
                    audioData.append(contentsOf: bytes)
                }
            }
            
            // Send as streaming audio chunk
            let base64Audio = audioData.base64EncodedString()
            sendMessage([
                "type": "audio_stream",
                "data": base64Audio,
                "format": "pcm16"
            ])
        } else if let int16ChannelData = buffer.int16ChannelData?[0] {
            // Already int16, just send it
            let audioData = Data(bytes: int16ChannelData, count: frameCount * 2)
            let base64Audio = audioData.base64EncodedString()
            sendMessage([
                "type": "audio_stream",
                "data": base64Audio,
                "format": "pcm16"
            ])
        }
    }
    
    func sendAudio(_ audioData: Data) {
        // Send raw audio to server (for one-shot recordings)
        let message = URLSessionWebSocketTask.Message.data(audioData)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("Failed to send audio: \(error)")
            }
        }
    }
    
    // MARK: - Voice Control
    func startListening() {
        let startTime = Date()
        
        // If audio is playing, stop it immediately for interruption
        if let player = currentAudioPlayer, player.isPlaying {
            print("🤚 Interrupting Kane's response at \(startTime.timeIntervalSince1970)")
            player.stop()
            currentAudioPlayer = nil
            print("⏱️ Audio stopped in \(Date().timeIntervalSince(startTime) * 1000)ms")
            
            // Notify server about interruption
            sendMessage([
                "type": "user_interrupted",
                "timestamp": startTime.timeIntervalSince1970,
                "client_id": "ios_simulator"  // Help identify simulator vs device
            ])
        }
        startStreaming()
    }
    
    func stopListening() {
        print("🛑 Stopping all Kane activity")
        
        // Stop any currently playing audio
        if let player = currentAudioPlayer, player.isPlaying {
            print("🔇 Stopping audio playback")
            player.stop()
            currentAudioPlayer = nil
        }
        
        // Stop audio streaming
        stopStreaming()
        
        // Notify server to cancel any ongoing responses
        sendMessage([
            "type": "strand_deactivated",
            "action": "stop_all",
            "timestamp": Date().timeIntervalSince1970
        ])
        
        print("✅ All Kane activity stopped")
    }
    
    private func playAudioResponse(_ base64Audio: String) {
        print("🔊 playAudioResponse called with \(base64Audio.count) chars")
        
        guard let audioData = Data(base64Encoded: base64Audio) else {
            print("❌ Failed to decode base64 audio")
            return
        }
        
        print("🎯 Decoding Hume audio: \(audioData.count) bytes")
        
        // Check first few bytes to confirm MP3 format
        let headerBytes = audioData.prefix(4)
        print("🔍 Audio header: \(headerBytes.map { String(format: "%02x", $0) }.joined())")
        
        // Stop any currently playing audio
        currentAudioPlayer?.stop()
        
        // Don't change audio session - use whatever is already configured
        print("🔊 Using existing audio session for playback")
        
        do {
            // Create and configure audio player
            currentAudioPlayer = try AVAudioPlayer(data: audioData)
            currentAudioPlayer?.delegate = self
            currentAudioPlayer?.volume = 1.0
            
            // Prepare and play
            guard let player = currentAudioPlayer else { return }
            
            print("🎵 Audio player created, duration: \(String(format: "%.1f", player.duration))s")
            
            if player.prepareToPlay() {
                print("✅ Audio prepared successfully")
                let didStart = player.play()
                print("🎵 Audio play() returned: \(didStart)")
                print("🔊 Player is playing: \(player.isPlaying)")
            } else {
                print("❌ Failed to prepare audio for playback")
            }
            
        } catch {
            print("❌ Failed to create audio player: \(error)")
            print("   Error details: \(error.localizedDescription)")
            currentAudioPlayer = nil
        }
    }
    
    // MARK: - AVAudioPlayerDelegate
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("🔊 Audio playback finished successfully: \(flag)")
        currentAudioPlayer = nil
        // No need to change audio session - keeping playAndRecord throughout
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("❌ Audio decode error: \(error?.localizedDescription ?? "Unknown")")
        currentAudioPlayer = nil
        // No need to change audio session - keeping playAndRecord throughout
    }
    
    // MARK: - Message Handling
    private func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                self?.handleMessage(message)
                self?.receiveMessage() // Continue listening
                
            case .failure(let error):
                print("WebSocket receive error: \(error)")
                self?.isConnected = false
                self?.connectionStatus = "Connection lost"
                
                // Attempt to reconnect after delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self?.connect()
                }
            }
        }
    }
    
    private func handleMessage(_ message: URLSessionWebSocketTask.Message) {
        switch message {
        case .string(let text):
            handleTextMessage(text)
            
        case .data(let data):
            // Could be binary audio data
            handleBinaryData(data)
            
        @unknown default:
            break
        }
    }
    
    private func handleTextMessage(_ text: String) {
        guard let data = text.data(using: .utf8),
              let message = try? JSONDecoder().decode(ServerMessage.self, from: data) else {
            print("Failed to decode message: \(text)")
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            switch message.type {
            case "quest_update":
                self?.handleQuestUpdate(message)
                
            case "voice_response":
                // KANE is speaking with voice
                if let audio = message.audio {
                    self?.playAudioResponse(audio)
                }
                if let text = message.text {
                    self?.lastKaneResponse = text
                    print("🎙️ KANE (voice): \(text)")
                }
                
            case "text_response":
                // KANE text-only response (when voice is disabled)
                if let text = message.text {
                    self?.lastKaneResponse = text
                    print("💬 KANE (text): \(text)")
                    // Could trigger TTS on device if desired
                }
                
            default:
                print("Unknown message type: \(message.type)")
            }
        }
    }
    
    private func handleQuestUpdate(_ message: ServerMessage) {
        switch message.action {
        case "create_quest":
            if let quest = message.quest {
                // Add with animation
                withAnimation(.spring()) {
                    quests.append(quest)
                }
                print("➕ Created draft quest: \(quest.title)")
            }
            
        case "update_quest":
            if let updatedQuest = message.quest,
               let index = quests.firstIndex(where: { $0.id == updatedQuest.id }) {
                withAnimation(.spring()) {
                    quests[index] = updatedQuest
                }
                print("✏️ Updated quest: \(updatedQuest.title)")
            }
            
        case "finalize_quest":
            if let finalizedQuest = message.quest,
               let index = quests.firstIndex(where: { $0.id == finalizedQuest.id }) {
                // Update with glow animation trigger
                withAnimation(.easeInOut(duration: 0.6)) {
                    quests[index] = finalizedQuest
                }
                print("✨ Finalized quest: \(finalizedQuest.title)")
                // The UI should trigger a glow animation here
            }
            
        case "delete_quest":
            if let deletedId = message.deleted,
               let index = quests.firstIndex(where: { $0.id == deletedId }) {
                withAnimation(.spring()) {
                    quests.remove(at: index)
                }
            }
            
        default:
            break
        }
    }
    
    private func handleBinaryData(_ data: Data) {
        // Handle raw binary data if needed
        // Could be audio chunks, etc.
    }
    
    // MARK: - Sending Messages
    func sendMessage(_ dict: [String: Any]) {
        guard let data = try? JSONSerialization.data(withJSONObject: dict),
              let string = String(data: data, encoding: .utf8) else {
            return
        }
        
        let message = URLSessionWebSocketTask.Message.string(string)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("Send error: \(error)")
            }
        }
    }
    
    // MARK: - Public Methods for UI
    func clearAllQuests() {
        quests.removeAll()
        sendMessage(["type": "clear_all"])
    }
    
    func testVoice() {
        print("🧪 Triggering voice test")
        sendMessage(["type": "test_voice", "text": "This is a voice test from Kane. Can you hear me clearly?"])
    }
    
}