import SwiftUI

struct QuestView: View {
    @StateObject private var serverConnection = KaneServerConnection()
    @State private var isStrandActive = false
    @State private var showingModal = false
    @State private var selectedQuest: Quest?
    
    // Animation states for launch
    @State private var headerOpacity: Double = 0
    @State private var contentOpacity: Double = 0
    @State private var strandOpacity: Double = 0
    @State private var contentOffset: CGFloat = 20
    
    var body: some View {
        ZStack {
            // Black background with subtle lens flares (from kane-native)
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                // Lens flare 1 - top left corner
                RadialGradient(
                    gradient: Gradient(colors: [
                        Color.cyan.opacity(0.08),
                        Color.cyan.opacity(0.02),
                        Color.clear
                    ]),
                    center: UnitPoint(x: -0.1, y: -0.1),
                    startRadius: 50,
                    endRadius: 300
                )
                .ignoresSafeArea()
                .blendMode(.plusLighter)
                
                // Lens flare 2 - bottom right edge
                RadialGradient(
                    gradient: Gradient(colors: [
                        Color.purple.opacity(0.06),
                        Color.purple.opacity(0.01),
                        Color.clear
                    ]),
                    center: UnitPoint(x: 1.1, y: 1.1),
                    startRadius: 80,
                    endRadius: 350
                )
                .ignoresSafeArea()
                .blendMode(.plusLighter)
            }
            
            // Pull-to-refresh ScrollView
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // Connection status (debug)
                    #if DEBUG
                    HStack {
                        Circle()
                            .fill(serverConnection.isConnected ? Color.green : Color.red)
                            .frame(width: 8, height: 8)
                        
                        Text(serverConnection.connectionStatus)
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(.white.opacity(0.4))
                        
                        Spacer()
                        
                        if !serverConnection.isConnected {
                            Button("Connect") {
                                serverConnection.connect()
                            }
                            .font(.system(size: 10))
                            .foregroundColor(.cyan.opacity(0.7))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    #endif
                    
                    // Header section with date and dynamic text
                    VStack(alignment: .leading, spacing: 8) {
                        // Date display
                        VStack(alignment: .leading, spacing: 4) {
                            Text("TODAY")
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundColor(.white.opacity(0.5))
                                .tracking(1.5)
                            
                            Text(formatDate(Date()))
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        
                        // Dynamic header text
                        DynamicQuestHeaderText(questCount: serverConnection.quests.count)
                            .padding(.top, 4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .opacity(headerOpacity)
                    .offset(y: contentOffset)
                    
                    // Main content
                    VStack(alignment: .leading, spacing: 24) {
                        // Quest cards section
                        if serverConnection.quests.isEmpty && !isStrandActive {
                            EmptyQuestView(serverConnection: serverConnection)
                                .frame(maxWidth: .infinity)
                                .opacity(contentOpacity)
                                .offset(y: contentOffset)
                        } else if !serverConnection.quests.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                // Show all quests equally
                                ForEach(serverConnection.quests) { quest in
                                    QuestCard(quest: quest)
                                        .transition(.asymmetric(
                                            insertion: .push(from: .top).combined(with: .opacity),
                                            removal: .scale.combined(with: .opacity)
                                        ))
                                        .animation(.spring(response: 0.5, dampingFraction: 0.8), value: serverConnection.quests.count)
                                        .onTapGesture {
                                            selectedQuest = quest
                                            showingModal = true
                                        }
                                }
                            }
                            .opacity(contentOpacity)
                            .offset(y: contentOffset)
                        }
                    }
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                        .frame(minHeight: 100)
                }
            }
            .refreshable {
                // Could refresh server connection
                try? await Task.sleep(nanoseconds: 500_000_000)
            }
            
            // Audio-reactive strand overlay at bottom - connected to our server
            VStack {
                Spacer()
                
                VStack(spacing: 0) {
                    KaneStrandView(
                        serverConnection: serverConnection,
                        isActive: $isStrandActive
                    )
                    .frame(height: 60)
                    .padding(.bottom, 40)
                    
                    Spacer()
                        .frame(height: 20)
                }
                .background(
                    LinearGradient(
                        colors: [
                            Color.black.opacity(0),
                            Color.black.opacity(0.8),
                            Color.black,
                            Color.black
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 200)
                    .offset(y: -60)
                )
            }
            .ignoresSafeArea(edges: .bottom)
            .opacity(strandOpacity)
        }
        .onAppear {
            // Auto-connect to server
            serverConnection.connect()
            
            // Staggered fade-in animations
            withAnimation(.easeOut(duration: 1.5).delay(0.5)) {
                headerOpacity = 1
                contentOffset = 0
            }
            
            withAnimation(.easeOut(duration: 1.2).delay(1.2)) {
                contentOpacity = 1
            }
            
            withAnimation(.easeOut(duration: 1.0).delay(1.8)) {
                strandOpacity = 1
            }
        }
        .sheet(isPresented: $showingModal) {
            if let quest = selectedQuest {
                QuestDetailView(quest: quest, isPresented: $showingModal)
            }
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter.string(from: date).uppercased()
    }
}

struct QuestCard: View {
    let quest: Quest
    
    @State private var glowOpacity = 0.0
    @State private var contentOpacity = 0.0
    @State private var scale = 0.9
    
    // Draft styling - TestFlight-like wireframe appearance
    private var draftOpacity: Double {
        quest.isDraft ? 0.4 : 1.0
    }
    
    private var draftOverlay: some View {
        Group {
            if quest.isDraft {
                // Thin grid overlay for draft state - increased spacing for less busy look
                Rectangle()
                    .fill(Color.clear)
                    .overlay(
                        GridPattern(spacing: 16, lineWidth: 0.5)
                            .stroke(Color.white.opacity(0.12))
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
    }
    
    var body: some View {
        ZStack {
            // Glass background - more subtle for drafts
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .opacity((quest.isDraft ? 0.15 : 0.3) * contentOpacity)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(quest.isDraft ? 0.02 : 0.05),
                            Color.white.opacity(quest.isDraft ? 0.01 : 0.02)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .opacity(contentOpacity * draftOpacity)
            
            // Draft grid overlay
            draftOverlay
            
            // Glow border - only for finalized quests
            if !quest.isDraft {
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                Color.cyan.opacity(0.7),
                                Color.purple.opacity(0.4)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
                    .opacity(glowOpacity)
                    .blur(radius: glowOpacity > 0.5 ? 1 : 0)
            } else {
                // Subtle border for drafts
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(Color.white.opacity(0.1), lineWidth: 0.5)
                    .opacity(contentOpacity)
            }
            
            // Content
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top) {
                    Text(quest.title)
                        .font(.system(size: 17, weight: quest.isDraft ? .regular : .medium))
                        .foregroundColor(.white.opacity(draftOpacity))
                        .lineLimit(nil)  // Never truncate title
                        .fixedSize(horizontal: false, vertical: true)  // Allow multi-line
                    
                    Spacer(minLength: 8)
                    
                    // Draft badge only
                    if quest.isDraft {
                        Text("DRAFT")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white.opacity(0.3))
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(
                                Capsule()
                                    .strokeBorder(Color.white.opacity(0.2), lineWidth: 0.5)
                            )
                    }
                }
                
                if let whyMatters = quest.whyMatters, !whyMatters.isEmpty {
                    Text(whyMatters)
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(quest.isDraft ? 0.3 : 0.6))
                        .lineLimit(3)
                        .lineSpacing(2)
                }
            }
            .padding()
            .opacity(contentOpacity)
        }
        .padding(.horizontal)
        .scaleEffect(scale)
        .onAppear {
            if quest.isDraft {
                // Subtle entrance for drafts
                withAnimation(.easeOut(duration: 0.4)) {
                    scale = 1.0
                    contentOpacity = 1.0
                }
            } else {
                // Dramatic entrance animation for finalized quests
                withAnimation(.easeOut(duration: 0.3)) {
                    glowOpacity = 1.0
                    scale = 1.0
                }
                
                withAnimation(.easeIn(duration: 0.4).delay(0.2)) {
                    contentOpacity = 1.0
                }
                
                withAnimation(.easeOut(duration: 0.5).delay(0.5)) {
                    glowOpacity = 0.2  // Consistent glow for all finalized quests
                }
            }
        }
        .onChange(of: quest.isDraft) { oldValue, newValue in
            // Glow animation when quest is finalized
            if oldValue == true && newValue == false {
                withAnimation(.easeInOut(duration: 0.8)) {
                    // Trigger finalization glow
                    glowOpacity = 1.0
                }
                
                // Then settle to normal glow
                withAnimation(.easeOut(duration: 0.6).delay(0.8)) {
                    glowOpacity = 0.2  // Consistent glow for all finalized quests
                }
            }
        }
    }
}

struct EmptyQuestView: View {
    let serverConnection: KaneServerConnection
    @State private var bounceAnimation = false
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "mic")
                .font(.system(size: 48, weight: .light))
                .foregroundColor(.white.opacity(0.3))
                .offset(y: bounceAnimation ? -8 : 0)
                .animation(
                    .easeInOut(duration: 1.2)
                    .repeatForever(autoreverses: true),
                    value: bounceAnimation
                )
            
            VStack(spacing: 8) {
                Text("Share what's on your mind")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white.opacity(0.7))
                
                Text("I'll help you turn your thoughts into clear, actionable quests")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .padding(.vertical, 40)
        .onAppear {
            bounceAnimation = true
        }
        .onTapGesture(count: 2) {
            // Debug: Double-tap to test voice
            print("🧪 Double tap detected - testing voice")
            serverConnection.testVoice()
        }
    }
}

struct DynamicQuestHeaderText: View {
    let questCount: Int
    
    private var headerText: String {
        if questCount == 0 {
            return "What will make today a success?"
        } else if questCount == 1 {
            return "What's the one thing that unlocks everything else?"
        } else if questCount == 2 {
            return "What would make this complete?"
        } else {
            return "Your quests are taking shape. Keep going."
        }
    }
    
    var body: some View {
        Text(headerText)
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(.white)
            .animation(.easeInOut, value: headerText)
    }
}

struct KaneStrandView: View {
    let serverConnection: KaneServerConnection
    @Binding var isActive: Bool
    
    @State private var wavePhase: CGFloat = 0
    @State private var timer: Timer?
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging = false
    @State private var bendAmount: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.clear
                
                if isActive && !isDragging {
                    // Active audio strands - simple version for now
                    ForEach(0..<3, id: \.self) { index in
                        KaneWave(
                            index: index,
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
            if isActive {
                deactivateStrand()
            }
        }
        .gesture(
            DragGesture(minimumDistance: 10)
                .onChanged { value in
                    if !isDragging && !isActive {
                        isDragging = true
                        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                        impactFeedback.prepare()
                        impactFeedback.impactOccurred()
                    }
                    
                    let upwardDrag = min(0, value.translation.height)
                    dragOffset = upwardDrag
                    bendAmount = abs(upwardDrag) / 300
                }
                .onEnded { value in
                    let upwardDrag = value.translation.height
                    
                    if upwardDrag < -30 && !isActive {
                        pluckStrand()
                    } else {
                        releaseStrand()
                    }
                }
        )
    }
    
    private func pluckStrand() {
        print("🎯 Kane strand activated!")
        
        let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedback.prepare()
        impactFeedback.impactOccurred()
        
        withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0)) {
            dragOffset = 0
            bendAmount = 0
            isDragging = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.isActive = true
            self.startAnimations()
            
            print("🎤 Starting Kane voice session...")
            self.serverConnection.startListening()
        }
    }
    
    private func releaseStrand() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0)) {
            dragOffset = 0
            bendAmount = 0
            isDragging = false
        }
    }
    
    private func deactivateStrand() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.prepare()
        impactFeedback.impactOccurred()
        
        isActive = false
        stopAnimations()
        
        print("🔇 Ending Kane voice session...")
        serverConnection.stopListening()
    }
    
    private func startAnimations() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { _ in
            wavePhase += 0.03
        }
    }
    
    private func stopAnimations() {
        timer?.invalidate()
        timer = nil
    }
}

struct KaneWave: View {
    let index: Int
    let phase: CGFloat
    let geometry: GeometryProxy
    
    private var baseAmplitude: CGFloat {
        [8, 12, 6][index]
    }
    
    private var frequency: CGFloat {
        [2.0, 3.0, 1.5][index]
    }
    
    private var phaseMultiplier: CGFloat {
        [1.0, 1.3, 0.7][index]
    }
    
    private var opacity: Double {
        [0.8, 0.5, 0.3][index]
    }
    
    var body: some View {
        Path { path in
            let midY = geometry.size.height / 2
            let width = geometry.size.width
            
            path.move(to: CGPoint(x: 0, y: midY))
            
            for x in stride(from: 0, to: width, by: 1) {
                let relativeX = x / width
                let wave = sin((relativeX * .pi * 3 * frequency) - (phase * phaseMultiplier))
                let y = midY + baseAmplitude * wave
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
            lineWidth: 1.5
        )
    }
}

// BentStrand is imported from AudioReactiveStrandView.swift

struct GridPattern: Shape {
    let spacing: CGFloat
    let lineWidth: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Vertical lines
        for x in stride(from: 0, through: rect.width, by: spacing) {
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: rect.height))
        }
        
        // Horizontal lines
        for y in stride(from: 0, through: rect.height, by: spacing) {
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: rect.width, y: y))
        }
        
        return path
    }
}

// Quest Detail Modal View
struct QuestDetailView: View {
    let quest: Quest
    @Binding var isPresented: Bool
    @State private var contentOpacity = 0.0
    
    var body: some View {
        ZStack {
            // Dark background
            Color.black.opacity(0.95)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header with close button
                HStack {
                    Text("QUEST DETAILS")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white.opacity(0.5))
                        .tracking(1.5)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.easeOut(duration: 0.2)) {
                            contentOpacity = 0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isPresented = false
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white.opacity(0.3))
                    }
                }
                .padding()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Status badge
                        HStack {
                            if quest.isDraft {
                                Label("DRAFT", systemImage: "pencil.circle")
                                    .font(.system(size: 11, weight: .bold))
                                    .foregroundColor(.white.opacity(0.4))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(
                                        Capsule()
                                            .strokeBorder(Color.white.opacity(0.2), lineWidth: 0.5)
                                    )
                            } else {
                                Label("FINALIZED", systemImage: "checkmark.circle.fill")
                                    .font(.system(size: 11, weight: .bold))
                                    .foregroundColor(.green.opacity(0.8))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(
                                        Capsule()
                                            .fill(Color.green.opacity(0.15))
                                    )
                            }
                            
                            Spacer()
                        }
                        
                        // Title
                        Text(quest.title)
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        // Why it matters
                        if let whyMatters = quest.whyMatters, !whyMatters.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("WHY IT MATTERS")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(.white.opacity(0.5))
                                    .tracking(1.5)
                                
                                Text(whyMatters)
                                    .font(.system(size: 16))
                                    .foregroundColor(.white.opacity(0.8))
                                    .lineSpacing(4)
                            }
                        }
                        
                        // Created date
                        VStack(alignment: .leading, spacing: 8) {
                            Text("CREATED")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.white.opacity(0.5))
                                .tracking(1.5)
                            
                            Text(formatDate(quest.createdAt))
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.6))
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .padding()
                }
            }
            .opacity(contentOpacity)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                contentOpacity = 1
            }
        }
    }
    
    private func formatDate(_ dateString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: dateString) {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        return dateString
    }
}