import SwiftUI
import AVFoundation

struct LaunchView: View {
    @State private var circleScale: CGFloat = 0.1
    @State private var showMainView = false
    @State private var animationComplete = false
    
    var body: some View {
        ZStack {
            if !animationComplete {
                // Launch animation: black circle on white background
                Color.white
                    .ignoresSafeArea()
                
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
            
            // Start the circle expansion animation
            withAnimation(.easeInOut(duration: 1.2)) {
                circleScale = 3.0 // Expand to fill screen
            }
            
            // After expansion, switch to main view
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                animationComplete = true
                withAnimation(.easeOut(duration: 0.3)) {
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