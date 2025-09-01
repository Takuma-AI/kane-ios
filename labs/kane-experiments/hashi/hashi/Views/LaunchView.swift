import SwiftUI
import AVFoundation

struct LaunchView: View {
    @State private var circleScale: CGFloat = 0.1
    @State private var showMainView = false
    @State private var animationComplete = false
    
    var body: some View {
        ZStack {
            // Always start with white background
            Color.white
                .ignoresSafeArea()
            
            if !animationComplete {
                // Launch animation: black circle expanding
                Circle()
                    .fill(Color.black)
                    .scaleEffect(circleScale)
                    .ignoresSafeArea()
            }
            
            if showMainView {
                MainView()
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
        }
        .preferredColorScheme(.light) // Force light mode initially
        .onAppear {
            // Request microphone permission immediately
            requestMicrophonePermission()
            
            // Small delay before starting animation for visual impact
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                // Start the circle expansion animation (slower)
                withAnimation(.easeInOut(duration: 1.8)) {
                    circleScale = 3.0 // Expand to fill screen
                }
            }
            
            // After expansion, switch to main view
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                animationComplete = true
                withAnimation(.easeOut(duration: 0.5)) {
                    showMainView = true
                }
            }
        }
    }
    
    private func requestMicrophonePermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            if granted {
                print("Microphone permission granted")
            } else {
                print("Microphone permission denied")
            }
        }
    }
}