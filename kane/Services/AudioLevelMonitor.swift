import Foundation
import AVFoundation
import Combine
import Accelerate
import SwiftUI

/// Monitors audio levels from the microphone in real-time
/// Provides both amplitude (volume) and frequency data for visualization
@MainActor
class AudioLevelMonitor: ObservableObject {
    // MARK: - Published Properties
    
    /// Current amplitude level (0.0 to 1.0)
    @Published var amplitude: Float = 0.0
    
    /// Frequency bands for visualization (low, mid, high frequencies)
    @Published var frequencyBands: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0]
    
    /// Whether monitoring is active
    @Published var isMonitoring = false
    
    // MARK: - Private Properties
    
    private let audioEngine = AVAudioEngine()
    private let bufferSize: AVAudioFrameCount = 1024
    private var cancellables = Set<AnyCancellable>()
    
    // FFT setup for frequency analysis
    private let fftSetup: FFTSetup
    private let log2n: vDSP_Length
    private let halfN: Int
    private var window: [Float] = []
    
    // Smoothing for visual appeal
    private var smoothedAmplitude: Float = 0.0
    private var smoothedFrequencies: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0]
    private let smoothingFactor: Float = 0.85
    
    // MARK: - Initialization
    
    init() {
        // Setup FFT for frequency analysis
        log2n = vDSP_Length(log2(Float(bufferSize)))
        halfN = Int(bufferSize / 2)
        fftSetup = vDSP_create_fftsetup(log2n, FFTRadix(kFFTRadix2))!
        
        // Create window function for better frequency analysis
        window = [Float](repeating: 0, count: Int(bufferSize))
        vDSP_hann_window(&window, vDSP_Length(bufferSize), Int32(vDSP_HANN_NORM))
    }
    
    deinit {
        vDSP_destroy_fftsetup(fftSetup)
        // Can't call stop() from deinit, will be cleaned up automatically
    }
    
    // MARK: - Public Methods
    
    func start() {
        guard !isMonitoring else { return }
        
        setupAudioSession()
        setupAudioEngine()
        
        do {
            try audioEngine.start()
            isMonitoring = true
        } catch {
            print("❌ Failed to start audio engine: \(error)")
        }
    }
    
    func stop() {
        guard isMonitoring else { return }
        
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        isMonitoring = false
        
        // Reset values with animation
        withAnimation(.easeOut(duration: 0.3)) {
            amplitude = 0.0
            frequencyBands = [0.0, 0.0, 0.0, 0.0, 0.0]
        }
    }
    
    // MARK: - Private Methods
    
    private func setupAudioSession() {
        let session = AVAudioSession.sharedInstance()
        
        do {
            // Configure for recording with playback
            try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
            try session.setActive(true)
        } catch {
            print("❌ Failed to setup audio session: \(error)")
        }
    }
    
    private func setupAudioEngine() {
        let inputNode = audioEngine.inputNode
        let inputFormat = inputNode.outputFormat(forBus: 0)
        
        // Install tap on input node to receive audio buffers
        inputNode.installTap(onBus: 0, bufferSize: bufferSize, format: inputFormat) { [weak self] buffer, _ in
            self?.processAudioBuffer(buffer)
        }
    }
    
    private func processAudioBuffer(_ buffer: AVAudioPCMBuffer) {
        guard let channelData = buffer.floatChannelData?[0] else { return }
        
        let frames = buffer.frameLength
        
        // Calculate amplitude (RMS - Root Mean Square)
        var rms: Float = 0.0
        vDSP_rmsqv(channelData, 1, &rms, vDSP_Length(frames))
        
        // Convert to decibels and normalize
        let avgPower = 20 * log10(rms)
        let minDb: Float = -60.0
        let normalizedPower = (avgPower - minDb) / -minDb
        let clampedPower = min(max(normalizedPower, 0.0), 1.0)
        
        // Smooth the amplitude for visual appeal
        smoothedAmplitude = (smoothingFactor * smoothedAmplitude) + ((1.0 - smoothingFactor) * clampedPower)
        
        // Perform FFT for frequency analysis
        let frequencies = performFFT(channelData, frameCount: Int(frames))
        
        // Update on main thread
        Task { @MainActor in
            self.amplitude = self.smoothedAmplitude
            self.frequencyBands = frequencies
        }
    }
    
    private func performFFT(_ data: UnsafePointer<Float>, frameCount: Int) -> [Float] {
        // Ensure we have enough data
        let fftSize = Int(bufferSize)
        guard frameCount >= fftSize else { return smoothedFrequencies }
        
        // Apply window function
        var windowedData = [Float](repeating: 0, count: fftSize)
        vDSP_vmul(data, 1, window, 1, &windowedData, 1, vDSP_Length(fftSize))
        
        // Prepare FFT
        var realPart = [Float](repeating: 0, count: halfN)
        var imagPart = [Float](repeating: 0, count: halfN)
        var splitComplex = DSPSplitComplex(realp: &realPart, imagp: &imagPart)
        
        // Convert to split complex format
        windowedData.withUnsafeBufferPointer { ptr in
            ptr.baseAddress!.withMemoryRebound(to: DSPComplex.self, capacity: halfN) { complexPtr in
                vDSP_ctoz(complexPtr, 2, &splitComplex, 1, vDSP_Length(halfN))
            }
        }
        
        // Perform FFT
        vDSP_fft_zrip(fftSetup, &splitComplex, 1, log2n, FFTDirection(kFFTDirection_Forward))
        
        // Calculate magnitudes
        var magnitudes = [Float](repeating: 0, count: halfN)
        vDSP_zvmags(&splitComplex, 1, &magnitudes, 1, vDSP_Length(halfN))
        
        // Convert to dB and normalize
        var normalizedMagnitudes = [Float](repeating: 0, count: halfN)
        var scaleFactor: Float = 25.0
        vDSP_vdbcon(magnitudes, 1, &scaleFactor, &normalizedMagnitudes, 1, vDSP_Length(halfN), 1)
        
        // Group into frequency bands (5 bands: sub-bass, bass, mid, high-mid, high)
        let bandSize = halfN / 5
        var bands: [Float] = []
        
        for i in 0..<5 {
            let startIdx = i * bandSize
            let endIdx = min((i + 1) * bandSize, halfN)
            
            var sum: Float = 0.0
            for j in startIdx..<endIdx {
                sum += max(0, normalizedMagnitudes[j])
            }
            
            let avg = sum / Float(endIdx - startIdx)
            let normalized = min(max(avg / 60.0, 0.0), 1.0) // Normalize to 0-1
            
            // Smooth the frequency band
            smoothedFrequencies[i] = (smoothingFactor * smoothedFrequencies[i]) + ((1.0 - smoothingFactor) * normalized)
            bands.append(smoothedFrequencies[i])
        }
        
        return bands
    }
}