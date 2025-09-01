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
            
            VStack(spacing: 0) {
                // Header section with date and dynamic text
                VStack(alignment: .leading, spacing: 8) {
                    // Date display with swipe gesture
                    SimpleDateDisplay(selectedDate: $selectedDate)
                    
                    // Dynamic header text
                    DynamicHeaderText(focusCount: todaysFocuses.count)
                        .padding(.top, 4)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Main content
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Success criteria section
                        if todaysFocuses.isEmpty && !isStrandActive {
                            EmptyStateView()
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
                                }
                            }
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
                                }
                            }
                        }
                    }
                    .padding(.vertical, 20)
                }
                
                Spacer()
                
                // Audio-reactive strand at bottom
                AudioReactiveStrandView(isActive: $isStrandActive)
                    .frame(height: 60)
            }
        }
        .onAppear {
            conversationManager.setContext(viewContext)
            debugPrintAllFocuses()
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
}

struct SimpleDateDisplay: View {
    @Binding var selectedDate: Date
    @State private var dragOffset: CGFloat = 0
    
    var body: some View {
        HStack(spacing: 20) {
            // Today's date (main display)
            Text(formatDate(selectedDate))
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
            
            // Tomorrow (faintly visible)
            if dragOffset < -20 {
                Text(formatDate(Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? selectedDate))
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.3))
                    .transition(.opacity)
            }
            
            Spacer()
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragOffset = value.translation.width
                }
                .onEnded { value in
                    let threshold: CGFloat = 50
                    
                    if value.translation.width > threshold {
                        // Swipe right - go to previous day
                        withAnimation {
                            selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? selectedDate
                        }
                    } else if value.translation.width < -threshold {
                        // Swipe left - go to next day
                        withAnimation {
                            selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? selectedDate
                        }
                    }
                    
                    withAnimation {
                        dragOffset = 0
                    }
                }
        )
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        
        if Calendar.current.isDateInToday(date) {
            formatter.dateFormat = "'Today,' EEEE 'the' d'st'"
        } else if Calendar.current.isDateInTomorrow(date) {
            formatter.dateFormat = "'Tomorrow,' EEEE 'the' d'st'"
        } else if Calendar.current.isDateInYesterday(date) {
            formatter.dateFormat = "'Yesterday,' EEEE 'the' d'st'"
        } else {
            formatter.dateFormat = "EEEE 'the' d'st'"
        }
        
        var dateString = formatter.string(from: date)
        
        // Fix ordinal suffix
        let day = Calendar.current.component(.day, from: date)
        let suffix: String
        switch day {
        case 1, 21, 31: suffix = "st"
        case 2, 22: suffix = "nd"
        case 3, 23: suffix = "rd"
        default: suffix = "th"
        }
        
        dateString = dateString.replacingOccurrences(of: "\(day)st", with: "\(day)\(suffix)")
        
        return dateString
    }
}

struct DynamicHeaderText: View {
    let focusCount: Int
    
    private var headerText: String {
        if focusCount == 0 {
            return "What will make today a success?"
        } else if focusCount == 1 {
            return "Focus. Execute. Ship."
        } else if focusCount == 2 {
            return "Two paths converge."
        } else {
            return "Maximum velocity engaged."
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
    var body: some View {
        VStack(spacing: 16) {
            // Arrow pointing down
            Image(systemName: "arrow.down")
                .font(.system(size: 20))
                .foregroundColor(.white.opacity(0.4))
                .padding(.top, 60)
            
            Text("Pluck the strand to begin")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.6))
        }
    }
}

struct FocusCard: View {
    let focus: Focus
    @State private var isAppearing = true
    @State private var glowOpacity = 0.0
    @State private var contentOpacity = 0.0
    @State private var scale = 0.9
    
    var body: some View {
        ZStack {
            // Glass background layers
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .opacity(0.3 * contentOpacity)
            
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
                .opacity(contentOpacity)
            
            // Dramatic glow border that appears first
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
                .opacity(contentOpacity)
            
            // Content
            VStack(alignment: .leading, spacing: 8) {
                Text(focus.title ?? "")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Text(focus.context ?? "")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.6))
                    .lineLimit(2)
                    .lineSpacing(2)
            }
            .padding()
            .opacity(contentOpacity)
        }
        .padding(.horizontal)
        .scaleEffect(scale)
        .onAppear {
            // Dramatic entrance animation sequence
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

