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
            ScrollView {
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
                                Text("Success criteria for today")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white.opacity(0.5))
                                    .textCase(.uppercase)
                                    .padding(.horizontal)
                                
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
                AudioReactiveStrandView(isActive: $isStrandActive)
                    .frame(height: 60)
                    .background(
                        LinearGradient(
                            colors: [
                                Color.black.opacity(0),
                                Color.black.opacity(0.8),
                                Color.black
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 100)
                        .offset(y: -40)
                    )
            }
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
            // Staggered fade-in animations
            withAnimation(.easeOut(duration: 0.8)) {
                headerOpacity = 1
                contentOffset = 0
            }
            
            // Content appears slightly after header
            withAnimation(.easeOut(duration: 0.8).delay(0.3)) {
                contentOpacity = 1
            }
            
            // Strand appears last
            withAnimation(.easeOut(duration: 0.6).delay(0.6)) {
                strandOpacity = 1
            }
        }
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
            return "What else?"
        } else if focusCount == 2 {
            return "One more thing?"
        } else {
            return "Maximum focus reached"
        }
    }
    
    private var fontSize: CGFloat {
        focusCount == 0 ? 28 : 20
    }
    
    var body: some View {
        Text(headerText)
            .font(.system(size: fontSize, weight: .bold))
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

