import SwiftUI

struct StrandView: View {
    @Binding var isActive: Bool
    @EnvironmentObject var conversationManager: ConversationManager
    @State private var wavePhase: CGFloat = 0
    @State private var glowPosition: CGFloat = 0.3
    @State private var timer: Timer?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if isActive {
                    // Background glow layers
                    ForEach(0..<3) { index in
                        WavePath(
                            amplitude: 12 - CGFloat(index * 2),
                            frequency: 2.5 + Double(index) * 0.5,
                            phase: wavePhase * (1.0 + CGFloat(index) * 0.2),
                            verticalOffset: CGFloat(index - 1) * 2,
                            phaseShift: CGFloat(index) * 0.5
                        )
                        .stroke(Color.white.opacity(0.1), lineWidth: 8)
                        .blur(radius: 6)
                    }
                    
                    // Main visible strands
                    ForEach(0..<5) { index in
                        WavePath(
                            amplitude: getAmplitude(for: index),
                            frequency: getFrequency(for: index),
                            phase: wavePhase * getPhaseMultiplier(for: index),
                            verticalOffset: getVerticalOffset(for: index),
                            phaseShift: getPhaseShift(for: index)
                        )
                        .stroke(
                            Color.white.opacity(getStrandOpacity(for: index)),
                            lineWidth: getStrandWidth(for: index)
                        )
                        .blur(radius: getStrandBlur(for: index))
                    }
                } else {
                    // Quiet dotted line when not active
                    DottedSoundBar(
                        dotSpacing: 4,
                        dotSize: 2,
                        glowPosition: glowPosition * 0.3
                    )
                    .fill(Color.white.opacity(0.6))
                }
            }
        }
        .onTapGesture {
            activateStrand()
        }
        .onAppear {
            startGlowAnimation()
        }
        .onChange(of: conversationManager.isConnected) { connected in
            if connected && !isActive {
                isActive = true
                startWaveAnimation()
            } else if !connected && isActive {
                isActive = false
                stopWaveAnimation()
            }
        }
    }
    
    func activateStrand() {
        if !isActive {
            // Haptic feedback for "plucking" the strand
            let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
            impactFeedback.prepare()
            impactFeedback.impactOccurred()
            
            isActive = true
            startWaveAnimation()
            Task {
                await conversationManager.startConversation()
            }
        } else {
            isActive = false
            stopWaveAnimation()
            conversationManager.endConversation()
        }
    }
    
    func startGlowAnimation() {
        withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
            glowPosition = 0.7
        }
    }
    
    func startWaveAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { _ in
            wavePhase += 0.05
        }
    }
    
    func stopWaveAnimation() {
        timer?.invalidate()
        timer = nil
        withAnimation(.easeOut(duration: 0.5)) {
            glowPosition = 0.2
        }
    }
    
    // Wave configuration from kane-native
    private func getAmplitude(for index: Int) -> CGFloat {
        let baseAmplitude: CGFloat = 8
        let variations: [CGFloat] = [0.8, 1.0, 0.6, 1.2, 0.7]
        return baseAmplitude * variations[index % variations.count]
    }
    
    private func getFrequency(for index: Int) -> CGFloat {
        let frequencies: [CGFloat] = [2.5, 3.0, 4.0, 2.0, 3.5]
        return frequencies[index % frequencies.count]
    }
    
    private func getPhaseMultiplier(for index: Int) -> CGFloat {
        let multipliers: [CGFloat] = [1.0, 1.2, 0.8, 1.5, 0.9]
        return multipliers[index % multipliers.count]
    }
    
    private func getVerticalOffset(for index: Int) -> CGFloat {
        let offsets: [CGFloat] = [0, -1, 1, -0.5, 0.5]
        return offsets[index % offsets.count]
    }
    
    private func getPhaseShift(for index: Int) -> CGFloat {
        let shifts: [CGFloat] = [0, 0.5, 1.0, 1.5, 0.25]
        return shifts[index % shifts.count]
    }
    
    private func getStrandOpacity(for index: Int) -> Double {
        let opacities: [Double] = [0.7, 0.5, 0.3, 0.6, 0.4]
        return opacities[index % opacities.count]
    }
    
    private func getStrandWidth(for index: Int) -> CGFloat {
        let widths: [CGFloat] = [2, 1.5, 1, 2.5, 1.5]
        return widths[index % widths.count]
    }
    
    private func getStrandBlur(for index: Int) -> CGFloat {
        let blurs: [CGFloat] = [0, 0.5, 1, 0.3, 0.8]
        return blurs[index % blurs.count]
    }
}

// Wave path shape from kane-native
struct WavePath: Shape {
    var amplitude: CGFloat
    var frequency: Double
    var phase: CGFloat
    var verticalOffset: CGFloat = 0
    var phaseShift: CGFloat = 0
    
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midY = rect.height / 2 + verticalOffset
        
        path.move(to: CGPoint(x: 0, y: midY))
        
        for x in stride(from: 0, to: rect.width, by: 1) {
            let relativeX = x / rect.width
            
            // Wave moving from left to right
            let primaryWave = sin((relativeX * .pi * 3 * frequency) - phase + phaseShift)
            
            // Very subtle secondary wave for organic feel
            let secondaryWave = sin((relativeX * .pi * 7) - phase * 0.5) * 0.1
            
            let combinedWave = primaryWave + secondaryWave
            let y = midY + amplitude * combinedWave
            
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        return path
    }
}

// Dotted sound bar for idle state
struct DottedSoundBar: Shape {
    var dotSpacing: CGFloat
    var dotSize: CGFloat
    var glowPosition: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midY = rect.height / 2
        
        // Create dots across the width
        for x in stride(from: dotSpacing, to: rect.width, by: dotSpacing) {
            let relativeX = x / rect.width
            
            // Make dots slightly bigger near the glow position
            let distanceFromGlow = abs(relativeX - glowPosition)
            let sizeMultiplier = 1.0 + (1.0 - min(distanceFromGlow * 3, 1.0)) * 0.5
            let currentDotSize = dotSize * sizeMultiplier
            
            // Add a very subtle vertical offset for organic feel
            let yOffset = sin(relativeX * .pi * 3) * 0.3
            
            path.addEllipse(in: CGRect(
                x: x - currentDotSize/2,
                y: midY - currentDotSize/2 + yOffset,
                width: currentDotSize,
                height: currentDotSize
            ))
        }
        
        return path
    }
}