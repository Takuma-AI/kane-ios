import SwiftUI

struct AudioReactiveStrandView: View {
    @Binding var isActive: Bool
    @EnvironmentObject var conversationManager: ConversationManager
    @StateObject private var audioMonitor = AudioLevelMonitor()
    
    @State private var wavePhase: CGFloat = 0
    @State private var timer: Timer?
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging = false
    @State private var bendAmount: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Invisible background to ensure tappability
                Color.clear
                
                if isActive && !isDragging {
                    // Audio-reactive strands - combine user and agent audio
                    ForEach(0..<5, id: \.self) { index in
                        AudioReactiveWave(
                            index: index,
                            amplitude: max(audioMonitor.amplitude, conversationManager.agentAudioLevel),
                            frequencyBand: audioMonitor.frequencyBands[safe: index] ?? 0.0,
                            phase: wavePhase,
                            geometry: geometry
                        )
                    }
                } else if isDragging {
                    // Bent strand while dragging
                    BentStrand(
                        bendAmount: bendAmount,
                        dragOffset: dragOffset,
                        geometry: geometry
                    )
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
            // Tap to deactivate when active
            if isActive {
                deactivateStrand()
            }
        }
        .gesture(
            DragGesture(minimumDistance: 10)
                .onChanged { value in
                    if !isDragging && !isActive {
                        // Start dragging - provide initial haptic
                        isDragging = true
                        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                        impactFeedback.prepare()
                        impactFeedback.impactOccurred()
                    }
                    
                    // Update drag offset (only upward)
                    let upwardDrag = min(0, value.translation.height)
                    dragOffset = upwardDrag
                    
                    // Calculate bend amount based on drag distance - much more subtle
                    bendAmount = abs(upwardDrag) / 300  // Changed from 100 to 300 for less bend
                }
                .onEnded { value in
                    // Check if drag was sufficient to activate
                    let upwardDrag = value.translation.height
                    
                    if upwardDrag < -30 && !isActive {
                        // Sufficient upward drag - activate strand
                        pluckStrand()
                    } else {
                        // Not enough drag or already active - release back
                        releaseStrand()
                    }
                }
        )
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
    
    private func pluckStrand() {
        print("🎯 Strand plucked!")
        
        // Strong haptic feedback for pluck
        let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedback.prepare()
        impactFeedback.impactOccurred()
        
        // Animate the release with bounce
        withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0)) {
            dragOffset = 0
            bendAmount = 0
            isDragging = false
        }
        
        // Activate after a brief delay to show the bounce
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.isActive = true
            self.startAnimations()
            
            print("🎤 Starting conversation...")
            Task {
                await self.conversationManager.startConversation()
            }
        }
    }
    
    private func releaseStrand() {
        // Animate back to rest position
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0)) {
            dragOffset = 0
            bendAmount = 0
            isDragging = false
        }
    }
    
    private func deactivateStrand() {
        // Haptic feedback for deactivation
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.prepare()
        impactFeedback.impactOccurred()
        
        isActive = false
        stopAnimations()
        
        print("🔇 Ending conversation...")
        conversationManager.endConversation()
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
    
    // Strand-specific properties based on index - increased variations
    private var baseAmplitude: CGFloat {
        [5, 15, 8, 20, 12][index]  // Much more variation in heights
    }
    
    private var frequency: CGFloat {
        [2.0, 3.5, 5.0, 1.5, 4.0][index]  // More frequency variation
    }
    
    private var phaseMultiplier: CGFloat {
        [1.0, 1.5, 0.6, 2.0, 0.8][index]  // More phase variation for desync
    }
    
    private var verticalOffset: CGFloat {
        [0, -3, 3, -1.5, 1.5][index]  // Slightly more vertical spread
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
                
                // Audio modulation - much more dramatic response
                // Amplitude affects overall wave height (increased from 2.0 to 5.0)
                let amplitudeModulation = 1.0 + CGFloat(amplitude) * 5.0
                
                // Frequency band creates additional ripples (increased from 0.3 to 0.6)
                let frequencyModulation = sin(relativeX * .pi * 8) * CGFloat(frequencyBand) * 0.6
                
                // Add secondary wave for more complexity when audio is active
                let secondaryWave = sin(relativeX * .pi * 12) * CGFloat(amplitude) * 0.4
                
                // Combine waves
                let combinedWave = baseWave + frequencyModulation + secondaryWave
                
                // Apply amplitude with audio reactivity (increased response)
                let finalAmplitude = baseAmplitude * amplitudeModulation * (0.3 + CGFloat(frequencyBand) * 1.5)
                
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

// Bent strand view for when dragging - subtle dotted effect
struct BentStrand: View {
    let bendAmount: CGFloat
    let dragOffset: CGFloat
    let geometry: GeometryProxy
    
    var body: some View {
        ZStack {
            // Create a dotted bent line similar to the inactive state
            Path { path in
                let midY = geometry.size.height / 2
                let width = geometry.size.width
                let controlPointY = midY + (dragOffset * 0.5) // Make bend even more subtle
                
                // Single dotted line that bends
                let dotSpacing: CGFloat = 6
                let dotSize: CGFloat = 2
                let numDots = Int(width / dotSpacing)
                
                for i in 0..<numDots {
                    let x = CGFloat(i) * dotSpacing
                    let t = x / width
                    
                    // Calculate position along the quadratic curve
                    let bezierY = pow(1 - t, 2) * midY + 
                                 2 * (1 - t) * t * controlPointY + 
                                 pow(t, 2) * midY
                    
                    // Draw a small circle (dot)
                    path.addEllipse(in: CGRect(
                        x: x - dotSize/2,
                        y: bezierY - dotSize/2,
                        width: dotSize,
                        height: dotSize
                    ))
                }
            }
            .fill(Color.white.opacity(0.6))
            
            // Subtle glow when bending
            if bendAmount > 0.01 {
                Path { path in
                    let midY = geometry.size.height / 2
                    let width = geometry.size.width
                    let controlPointY = midY + (dragOffset * 0.5)
                    
                    path.move(to: CGPoint(x: 0, y: midY))
                    path.addQuadCurve(
                        to: CGPoint(x: width, y: midY),
                        control: CGPoint(x: width / 2, y: controlPointY)
                    )
                }
                .stroke(Color.white.opacity(0.2 * bendAmount), lineWidth: 1)
                .blur(radius: 2)
            }
        }
    }
}

// Extension for safe array access
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}