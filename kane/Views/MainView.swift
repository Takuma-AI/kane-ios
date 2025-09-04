import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var conversationManager: ConversationManager
    
    // Fetch ALL focuses for now (to debug)
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Focus.createdAt, ascending: false)]
    ) private var todaysFocuses: FetchedResults<Focus>
    
    // Fetch blocker tasks
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \FocusTask.createdAt, ascending: false)],
        predicate: NSPredicate(format: "isBlocker == YES AND completedAt == nil")
    ) private var blockerTasks: FetchedResults<FocusTask>
    
    @State private var selectedDate = Date()
    @State private var isStrandActive = false
    @State private var showingModal = false
    @State private var selectedFocus: Focus?
    @State private var selectedTask: FocusTask?
    @State private var mockAgentTask: FocusTask?
    
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
                // Debug reset button (top right, very small)
                #if DEBUG
                HStack {
                    Spacer()
                    Button(action: {
                        resetDatabase()
                    }) {
                        Image(systemName: "trash.circle")
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.2))
                    }
                    .padding(.trailing, 10)
                    .padding(.top, 10)
                }
                #endif
                
                // Header section with date and dynamic text
                VStack(alignment: .leading, spacing: 8) {
                    // Date display with swipe gesture
                    SimpleDateDisplay(selectedDate: $selectedDate)
                    
                    // Dynamic header text
                    DynamicHeaderText(focusCount: todaysFocuses.count)
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
                    // Success criteria section
                    if todaysFocuses.isEmpty && !isStrandActive {
                        EmptyStateView()
                            .frame(maxWidth: .infinity)
                            .opacity(contentOpacity)
                            .offset(y: contentOffset)
                    } else if !todaysFocuses.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(todaysFocuses) { focus in
                                    FocusCard(focus: focus)
                                        .transition(.asymmetric(
                                            insertion: .push(from: .top).combined(with: .opacity),
                                            removal: .scale.combined(with: .opacity)
                                        ))
                                        .animation(.spring(response: 0.5, dampingFraction: 0.8), value: todaysFocuses.count)
                                        .onTapGesture {
                                            selectedFocus = focus
                                            selectedTask = nil
                                            showingModal = true
                                        }
                                }
                            }
                            .opacity(contentOpacity)
                            .offset(y: contentOffset)
                        }
                        
                        // Blocker tasks section
                        if !blockerTasks.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Other blockers")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white.opacity(0.5))
                                    .textCase(.uppercase)
                                    .padding(.horizontal)
                                
                                ForEach(blockerTasks) { task in
                                    TaskRow(task: task)
                                        .padding(.horizontal)
                                        .onTapGesture {
                                            selectedTask = task
                                            selectedFocus = nil
                                            showingModal = true
                                        }
                                }
                            }
                        }
                        
                        // Agent Task Cards (Mock) - Only show when there are focuses
                        if !todaysFocuses.isEmpty {
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Meanwhile...")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white.opacity(0.5))
                                .textCase(.uppercase)
                                .padding(.horizontal)
                            
                            VStack(spacing: 12) {
                                Button(action: {
                                    mockAgentTask = createMockAgentTask(
                                        title: "Health insurance analysis",
                                        content: "Analyzing health insurance options based on your startup needs and budget constraints. Currently comparing 3 plans under $400/month with good coverage.",
                                        aiProgress: "Blue Shield PPO ($389/mo): Best network coverage\nKaiser HMO ($320/mo): Most affordable\nAnthem PPO ($410/mo): Best for travel"
                                    )
                                    selectedTask = mockAgentTask
                                    selectedFocus = nil
                                    showingModal = true
                                }) {
                                    AgentTaskCard(
                                        title: "Health insurance sorted",
                                        status: "Comparing 3 plans that fit your startup budget",
                                        progress: 0.7,
                                        icon: "heart.text.square"
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                Button(action: {
                                    mockAgentTask = createMockAgentTask(
                                        title: "Parents' anniversary dinner",
                                        content: "Reserved special table for your parents' anniversary celebration at their favorite restaurant.",
                                        aiProgress: "✅ Confirmed: Saturday 7pm\n✅ Window table reserved\n✅ Anniversary dessert arranged\n✅ Dietary restrictions noted"
                                    )
                                    selectedTask = mockAgentTask
                                    selectedFocus = nil
                                    showingModal = true
                                }) {
                                    AgentTaskCard(
                                        title: "Parents' dinner secured",
                                        status: "Booked at Chez Laurent for Saturday 7pm",
                                        progress: 1.0,
                                        icon: "fork.knife"
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                Button(action: {
                                    mockAgentTask = createMockAgentTask(
                                        title: "Personalized skincare routine",
                                        content: "Building your personalized morning and evening skincare routine based on combination skin type analysis.",
                                        aiProgress: "Morning routine:\n1. Gentle cleanser (CeraVe Foaming)\n2. Vitamin C serum (Skinceuticals)\n3. Moisturizer + SPF\n\nEvening:\n1. Oil cleanser\n2. Retinol (analyzing 12 options...)"
                                    )
                                    selectedTask = mockAgentTask
                                    selectedFocus = nil
                                    showingModal = true
                                }) {
                                    AgentTaskCard(
                                        title: "Your skincare routine",
                                        status: "Analyzing your skin type against 42 products",
                                        progress: 0.4,
                                        icon: "sparkles"
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .padding(.horizontal)
                        }
                        .opacity(contentOpacity * 0.8)
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
                // Trigger a refresh - could reload data from Core Data
                // For now, just a placeholder that completes immediately
                try? await Task.sleep(nanoseconds: 500_000_000)
            }
            
            // Audio-reactive strand overlay at bottom
            VStack {
                Spacer()
                
                // Container with background that extends to bottom
                VStack(spacing: 0) {
                    // The actual strand with safe padding from bottom
                    AudioReactiveStrandView(isActive: $isStrandActive)
                        .frame(height: 60)
                        .padding(.bottom, 40) // Safe distance from iOS gesture area
                    
                    // Extra space at bottom for background
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
            conversationManager.setContext(viewContext)
            debugPrintAllFocuses()
        }
        .overlay(
            Group {
                if showingModal {
                    GlassmorphicModal(
                        isPresented: $showingModal,
                        focus: selectedFocus,
                        task: selectedTask
                    )
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
            }
        )
        .onAppear {
            // Staggered fade-in animations - much slower
            withAnimation(.easeOut(duration: 1.5).delay(0.5)) {
                headerOpacity = 1
                contentOffset = 0
            }
            
            // Content appears after header with longer delay
            withAnimation(.easeOut(duration: 1.2).delay(1.2)) {
                contentOpacity = 1
            }
            
            // Strand appears last, even later
            withAnimation(.easeOut(duration: 1.0).delay(1.8)) {
                strandOpacity = 1
            }
        }
    }
    
    // Helper function to create mock agent tasks for modal display
    func createMockAgentTask(title: String, content: String, aiProgress: String) -> FocusTask {
        let task = FocusTask(context: viewContext)
        task.id = UUID()
        task.content = content
        task.aiProgress = aiProgress
        task.createdAt = Date()
        task.isBlocker = false
        // Don't save - this is just for display
        return task
    }
    
    func debugPrintAllFocuses() {
        let request: NSFetchRequest<Focus> = Focus.fetchRequest()
        do {
            let allFocuses = try viewContext.fetch(request)
            print("📊 DATABASE CHECK: Found \(allFocuses.count) Focus items:")
            for focus in allFocuses {
                print("   - \(focus.title ?? "Untitled") | Date: \(focus.date) | ID: \(focus.id)")
            }
        } catch {
            print("❌ Failed to fetch focuses: \(error)")
        }
    }
    
    func resetDatabase() {
        print("🗑️ Resetting database...")
        
        // Delete all focuses
        let focusRequest: NSFetchRequest<NSFetchRequestResult> = Focus.fetchRequest()
        let focusDeleteRequest = NSBatchDeleteRequest(fetchRequest: focusRequest)
        
        // Delete all tasks
        let taskRequest: NSFetchRequest<NSFetchRequestResult> = FocusTask.fetchRequest()
        let taskDeleteRequest = NSBatchDeleteRequest(fetchRequest: taskRequest)
        
        do {
            try viewContext.execute(focusDeleteRequest)
            try viewContext.execute(taskDeleteRequest)
            try viewContext.save()
            
            // Force refresh the view
            viewContext.refreshAllObjects()
            
            print("✅ Database reset complete")
            
            // Haptic feedback
            let impactFeedback = UIImpactFeedbackGenerator(style: .light)
            impactFeedback.prepare()
            impactFeedback.impactOccurred()
        } catch {
            print("❌ Failed to reset database: \(error)")
        }
    }
}

struct SimpleDateDisplay: View {
    @Binding var selectedDate: Date
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging = false
    @State private var headerOpacity: Double = 1.0
    
    private var dynamicHeader: String {
        let calendar = Calendar.current
        if calendar.isDateInToday(selectedDate) {
            return "TODAY"
        } else if calendar.isDateInTomorrow(selectedDate) {
            return "TOMORROW"
        } else {
            // Get the weekday
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            return "THIS \(formatter.string(from: selectedDate).uppercased())"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Dynamic header that changes based on selected date
            Text(dynamicHeader)
                .font(.system(size: 10, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
                .tracking(1.5)
                .opacity(headerOpacity)
                .animation(.easeInOut(duration: 0.2), value: dynamicHeader)
            
            // Date carousel
            ZStack(alignment: .leading) {
                // Current date (always in same position)
                Text(formatDate(selectedDate))
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .offset(x: dragOffset * 0.5)
                
                // Next dates preview when dragging
                if isDragging && dragOffset < -20 {
                    HStack(spacing: 30) {
                        if let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) {
                            Text(formatDate(tomorrow))
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white.opacity(min(0.6, abs(dragOffset) / 100.0)))
                        }
                        
                        if let dayAfter = Calendar.current.date(byAdding: .day, value: 2, to: selectedDate) {
                            Text(formatDate(dayAfter))
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white.opacity(min(0.3, abs(dragOffset) / 150.0)))
                        }
                    }
                    .offset(x: 200 + dragOffset * 0.5)
                }
                
                // Previous date preview when dragging
                if isDragging && dragOffset > 20 {
                    if let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) {
                        Text(formatDate(yesterday))
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white.opacity(min(0.6, dragOffset / 100.0)))
                            .offset(x: -200 + dragOffset * 0.5)
                    }
                }
            }
            .frame(height: 24)
            .clipped()
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    isDragging = true
                    dragOffset = value.translation.width
                    
                    // Fade out header during drag
                    withAnimation(.easeOut(duration: 0.1)) {
                        headerOpacity = max(0.2, 1.0 - abs(value.translation.width) / 100.0)
                    }
                }
                .onEnded { value in
                    let threshold: CGFloat = 50
                    
                    if value.translation.width > threshold {
                        // Swipe right - go to previous day
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? selectedDate
                        }
                    } else if value.translation.width < -threshold {
                        // Swipe left - go to next day
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? selectedDate
                        }
                    }
                    
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        dragOffset = 0
                        isDragging = false
                    }
                    
                    // Fade header back in
                    withAnimation(.easeIn(duration: 0.3).delay(0.1)) {
                        headerOpacity = 1.0
                    }
                }
        )
        .animation(.easeInOut(duration: 0.2), value: isDragging)
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter.string(from: date).uppercased()
    }
}

struct DynamicHeaderText: View {
    let focusCount: Int
    
    private var headerText: String {
        if focusCount == 0 {
            return "What will make today a success?"
        } else if focusCount == 1 {
            return "What's the one thing that unlocks everything else?"
        } else if focusCount == 2 {
            return "What would make this complete?"
        } else {
            return "Your focus is set. Time to execute."
        }
    }
    
    var body: some View {
        Text(headerText)
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(.white)
            .animation(.easeInOut, value: headerText)
    }
}

struct EmptyStateView: View {
    @State private var bounceAnimation = false
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
                .frame(minHeight: 200)
            
            // Just the activation instruction
            Image(systemName: "arrow.up")
                .font(.system(size: 24, weight: .light))
                .foregroundColor(.white.opacity(0.4))
                .offset(y: bounceAnimation ? -8 : 0)
                .animation(
                    .easeInOut(duration: 1.2)
                    .repeatForever(autoreverses: true),
                    value: bounceAnimation
                )
            
            Text("Drag the strand upward to begin")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.5))
            
            Spacer()
                .frame(minHeight: 100)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal)
        .onAppear {
            bounceAnimation = true
        }
    }
}

struct FocusCard: View {
    let focus: Focus
    @State private var isAppearing = true
    @State private var glowOpacity = 0.0
    @State private var contentOpacity = 0.0
    @State private var scale = 0.9
    
    // Determine if this is a draft (no context or very short context)
    private var isDraft: Bool {
        guard let context = focus.context else { return true }
        return context.trimmingCharacters(in: .whitespacesAndNewlines).count < 10
    }
    
    // Base opacity for the card
    private var baseOpacity: Double {
        isDraft ? 0.5 : 1.0
    }
    
    var body: some View {
        ZStack {
            // Glass background layers
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .opacity(0.3 * contentOpacity * baseOpacity)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.05),
                            Color.white.opacity(0.02)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .opacity(contentOpacity * baseOpacity)
            
            // Dramatic glow border that appears first (only for approved/active)
            if !isDraft {
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                Color.cyan.opacity(0.8),
                                Color.purple.opacity(0.4)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
                    .opacity(glowOpacity)
                    .blur(radius: glowOpacity > 0.5 ? 1 : 0)
            }
            
            // Regular border
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.2),
                            Color.white.opacity(0.05)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 0.5
                )
                .opacity(contentOpacity * baseOpacity)
            
            // Content
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(focus.title ?? "")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(.white.opacity(isDraft ? 0.7 : 1.0))
                        .lineLimit(2)
                    
                    Spacer()
                    
                    // Draft indicator
                    if isDraft {
                        Text("DRAFT")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white.opacity(0.4))
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(
                                Capsule()
                                    .fill(Color.white.opacity(0.1))
                            )
                    }
                }
                
                if let context = focus.context, !context.isEmpty {
                    Text(context)
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(isDraft ? 0.4 : 0.6))
                        .lineLimit(2)
                        .lineSpacing(2)
                } else {
                    Text("Tap to add context")
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.3))
                        .italic()
                }
            }
            .padding()
            .opacity(contentOpacity)
        }
        .padding(.horizontal)
        .scaleEffect(scale)
        .onAppear {
            if isDraft {
                // Subtle entrance for drafts
                withAnimation(.easeOut(duration: 0.3)) {
                    scale = 1.0
                    contentOpacity = 1.0
                }
            } else {
                // Dramatic entrance animation sequence for approved
                withAnimation(.easeOut(duration: 0.3)) {
                    glowOpacity = 1.0
                    scale = 1.0
                }
                
                // Fade in content after glow
                withAnimation(.easeIn(duration: 0.4).delay(0.2)) {
                    contentOpacity = 1.0
                }
                
                // Fade out glow
                withAnimation(.easeOut(duration: 0.5).delay(0.5)) {
                    glowOpacity = 0.0
                }
            }
            
            isAppearing = false
        }
    }
}

struct TaskRow: View {
    let task: FocusTask
    @State private var isCompleted = false
    
    var body: some View {
        ZStack {
            // Subtle glass background
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .opacity(0.15)
            
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.white.opacity(0.1), lineWidth: 0.5)
            
            HStack {
                // Progress circle
                ZStack {
                    Circle()
                        .strokeBorder(Color.white.opacity(0.3), lineWidth: 1.5)
                        .frame(width: 20, height: 20)
                    
                    if isCompleted || task.completedAt != nil {
                        Circle()
                            .fill(Color.green.opacity(0.8))
                            .frame(width: 12, height: 12)
                            .transition(.scale.combined(with: .opacity))
                    }
                    
                    // Progress indicator for AI work
                    if let aiProgress = task.aiProgress, !aiProgress.isEmpty {
                        Circle()
                            .trim(from: 0, to: 0.3)
                            .stroke(Color.cyan, lineWidth: 2)
                            .frame(width: 20, height: 20)
                            .rotationEffect(.degrees(-90))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: aiProgress)
                    }
                }
                .onTapGesture {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        isCompleted.toggle()
                    }
                }
                
                Text(task.content ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.8))
                    .strikethrough(isCompleted || task.completedAt != nil, color: .white.opacity(0.5))
                
                Spacer()
                
                if let aiProgress = task.aiProgress, !aiProgress.isEmpty {
                    Text("AI working...")
                        .font(.caption)
                        .foregroundColor(.cyan.opacity(0.7))
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
        .onAppear {
            isCompleted = task.completedAt != nil
        }
    }
}

struct AgentTaskCard: View {
    let title: String
    let status: String
    let progress: Double
    let icon: String
    
    @State private var pulseAnimation = false
    
    var body: some View {
        ZStack {
            // Subtle glass background with gradient
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.cyan.opacity(0.05),
                            Color.purple.opacity(0.03)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(
                    LinearGradient(
                        colors: [
                            Color.cyan.opacity(0.2),
                            Color.purple.opacity(0.1)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 0.5
                )
            
            HStack(spacing: 12) {
                // Icon with subtle animation
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.05))
                        .frame(width: 36, height: 36)
                    
                    if progress < 1.0 {
                        Circle()
                            .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
                            .frame(width: 36, height: 36)
                            .scaleEffect(pulseAnimation ? 1.2 : 1.0)
                            .opacity(pulseAnimation ? 0 : 0.5)
                            .animation(
                                .easeInOut(duration: 2)
                                .repeatForever(autoreverses: false),
                                value: pulseAnimation
                            )
                    }
                    
                    Image(systemName: icon)
                        .font(.system(size: 16))
                        .foregroundColor(progress >= 1.0 ? .green.opacity(0.8) : .cyan.opacity(0.7))
                }
                
                // Content
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white.opacity(0.9))
                    
                    Text(status)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                        .lineLimit(1)
                }
                
                Spacer()
                
                // Progress indicator
                if progress < 1.0 {
                    ZStack {
                        Circle()
                            .stroke(Color.white.opacity(0.1), lineWidth: 2)
                            .frame(width: 32, height: 32)
                        
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(
                                LinearGradient(
                                    colors: [Color.cyan, Color.purple],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                style: StrokeStyle(lineWidth: 2, lineCap: .round)
                            )
                            .frame(width: 32, height: 32)
                            .rotationEffect(Angle(degrees: -90))
                        
                        Text("\(Int(progress * 100))%")
                            .font(.system(size: 9, weight: .medium))
                            .foregroundColor(.white.opacity(0.5))
                    }
                } else {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.green.opacity(0.8))
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
        }
        .onAppear {
            if progress < 1.0 {
                pulseAnimation = true
            }
        }
    }
}

