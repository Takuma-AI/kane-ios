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
        .onAppear {
            // Request microphone permission immediately
            requestMicrophonePermission()
            
            // Start animation immediately for smooth transition
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                // Start the circle expansion animation
                withAnimation(.easeInOut(duration: 1.5)) {
                    circleScale = 3.0 // Expand to fill screen
                }
            }
            
            // After expansion, switch to main view
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                animationComplete = true
                withAnimation(.easeOut(duration: 0.4)) {
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