import SwiftUI

struct AudioReactiveStrandView: View {
    @Binding var isActive: Bool
    @EnvironmentObject var conversationManager: ConversationManager
    @StateObject private var audioMonitor = AudioLevelMonitor()
    
    @State private var wavePhase: CGFloat = 0
    @State private var timer: Timer?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Invisible background to ensure tappability
                Color.clear
                
                if isActive {
                    // Audio-reactive strands
                    ForEach(0..<5, id: \.self) { index in
                        AudioReactiveWave(
                            index: index,
                            amplitude: audioMonitor.amplitude,
                            frequencyBand: audioMonitor.frequencyBands[safe: index] ?? 0.0,
                            phase: wavePhase,
                            geometry: geometry
                        )
                    }
                } else {
                    // Quiet dotted line when not active
                    DottedSoundBar(
                        dotSpacing: 4,
                        dotSize: 2,
                        glowPosition: 0.3
                    )
                    .fill(Color.white.opacity(0.6))
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            activateStrand()
        }
        .onChange(of: conversationManager.isConnected) { connected in
            if connected && !isActive {
                isActive = true
                startAnimations()
            } else if !connected && isActive {
                isActive = false
                stopAnimations()
            }
        }
        .onDisappear {
            stopAnimations()
        }
    }
    
    private func activateStrand() {
        print("🎯 Strand tapped! isActive: \(isActive)")
        if !isActive {
            // Haptic feedback
            let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
            impactFeedback.prepare()
            impactFeedback.impactOccurred()
            
            isActive = true
            startAnimations()
            
            print("🎤 Starting conversation...")
            Task {
                await conversationManager.startConversation()
            }
        } else {
            isActive = false
            stopAnimations()
            
            print("🔇 Ending conversation...")
            conversationManager.endConversation()
        }
    }
    
    private func startAnimations() {
        // Start audio monitoring
        audioMonitor.start()
        
        // Start wave phase animation
        timer = Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { _ in
            wavePhase += 0.03
        }
    }
    
    private func stopAnimations() {
        // Stop audio monitoring
        audioMonitor.stop()
        
        // Stop wave animation
        timer?.invalidate()
        timer = nil
    }
}

// Individual audio-reactive wave strand
struct AudioReactiveWave: View {
    let index: Int
    let amplitude: Float
    let frequencyBand: Float
    let phase: CGFloat
    let geometry: GeometryProxy
    
    // Strand-specific properties based on index
    private var baseAmplitude: CGFloat {
        [8, 10, 6, 12, 7][index]
    }
    
    private var frequency: CGFloat {
        [2.5, 3.0, 4.0, 2.0, 3.5][index]
    }
    
    private var phaseMultiplier: CGFloat {
        [1.0, 1.2, 0.8, 1.5, 0.9][index]
    }
    
    private var verticalOffset: CGFloat {
        [0, -1.5, 1.5, -0.75, 0.75][index]
    }
    
    private var opacity: Double {
        let baseOpacity = [0.7, 0.5, 0.3, 0.6, 0.4][index]
        // Boost opacity based on frequency band
        return min(baseOpacity + Double(frequencyBand) * 0.3, 1.0)
    }
    
    private var lineWidth: CGFloat {
        let baseWidth: CGFloat = [2, 1.5, 1, 2.5, 1.5][index]
        // Slightly increase width with amplitude
        return baseWidth + CGFloat(amplitude) * 0.5
    }
    
    var body: some View {
        Path { path in
            let midY = geometry.size.height / 2 + verticalOffset
            let width = geometry.size.width
            
            path.move(to: CGPoint(x: 0, y: midY))
            
            for x in stride(from: 0, to: width, by: 1) {
                let relativeX = x / width
                
                // Base wave
                let baseWave = sin((relativeX * .pi * 3 * frequency) - (phase * phaseMultiplier))
                
                // Audio modulation
                // Amplitude affects overall wave height
                let amplitudeModulation = 1.0 + CGFloat(amplitude) * 2.0
                
                // Frequency band creates additional ripples
                let frequencyModulation = sin(relativeX * .pi * 8) * CGFloat(frequencyBand) * 0.3
                
                // Combine waves
                let combinedWave = baseWave + frequencyModulation
                
                // Apply amplitude with audio reactivity
                let finalAmplitude = baseAmplitude * amplitudeModulation * (0.5 + CGFloat(frequencyBand))
                
                let y = midY + finalAmplitude * combinedWave
                
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        .stroke(
            LinearGradient(
                colors: [
                    Color.white.opacity(opacity),
                    Color.cyan.opacity(opacity * 0.5)
                ],
                startPoint: .leading,
                endPoint: .trailing
            ),
            lineWidth: lineWidth
        )
        .blur(radius: index % 2 == 0 ? 0 : 0.5)
        .animation(.easeInOut(duration: 0.1), value: amplitude)
        .animation(.easeInOut(duration: 0.15), value: frequencyBand)
    }
}

// Extension for safe array access
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}