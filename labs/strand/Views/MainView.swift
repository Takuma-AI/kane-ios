import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var conversationManager: ConversationManager
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Focus.createdAt, ascending: false)],
        predicate: NSPredicate(format: "date >= %@ AND date < %@", 
                              Calendar.current.startOfDay(for: Date()) as NSDate,
                              Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: Date()))! as NSDate)
    )
    private var todaysFocuses: FetchedResults<Focus>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.createdAt, ascending: false)],
        predicate: NSPredicate(format: "isBlocker == YES AND completedAt == nil")
    )
    private var blockerTasks: FetchedResults<Task>
    
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
                // Calendar scroll at top
                CalendarView(selectedDate: $selectedDate)
                    .frame(height: 60)
                    .padding(.top)
                
                // Main content
                ScrollView {
                    VStack(spacing: 20) {
                        // Focus cards
                        if todaysFocuses.isEmpty && !isStrandActive {
                            EmptyStateView()
                        } else {
                            ForEach(todaysFocuses) { focus in
                                FocusCard(focus: focus)
                            }
                        }
                        
                        // Blocker tasks
                        if !blockerTasks.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Clearing the path")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.6))
                                
                                ForEach(blockerTasks) { task in
                                    TaskRow(task: task)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical, 20)
                }
                
                Spacer()
                
                // Strand at bottom
                StrandView(isActive: $isStrandActive)
                    .frame(height: 60)
            }
        }
        .onAppear {
            conversationManager.setContext(viewContext)
        }
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Pluck the strand to begin your journey")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.6))
                .padding(.top, 100)
        }
    }
}

struct FocusCard: View {
    let focus: Focus
    
    var body: some View {
        ZStack {
            // Glass background layers
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .opacity(0.3)
            
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
            
            // Border glow
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
            
            // Content
            VStack(alignment: .leading, spacing: 12) {
                Text(focus.title ?? "")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(focus.context ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(3)
                
                HStack {
                    Circle()
                        .fill(focus.completed ? Color.green.opacity(0.8) : Color.white.opacity(0.3))
                        .frame(width: 8, height: 8)
                    
                    Text(focus.completed ? "Complete" : "In progress")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                    
                    Spacer()
                }
            }
            .padding()
        }
        .padding(.horizontal)
    }
}

struct TaskRow: View {
    let task: Task
    
    var body: some View {
        ZStack {
            // Subtle glass background
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .opacity(0.15)
            
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.white.opacity(0.1), lineWidth: 0.5)
            
            HStack {
                Circle()
                    .strokeBorder(Color.white.opacity(0.3), lineWidth: 1.5)
                    .frame(width: 20, height: 20)
                
                Text(task.content ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.8))
                
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
    }
}

struct CalendarView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(-7..<8) { dayOffset in
                    let date = Calendar.current.date(byAdding: .day, value: dayOffset, to: Date())!
                    let isToday = Calendar.current.isDateInToday(date)
                    let isSelected = Calendar.current.isDate(date, inSameDayAs: selectedDate)
                    
                    VStack(spacing: 4) {
                        Text(dayName(for: date))
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        
                        Text("\(Calendar.current.component(.day, from: date))")
                            .font(.system(size: 16, weight: isToday ? .bold : .regular))
                            .foregroundColor(isSelected ? .white : .white.opacity(0.7))
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(isSelected ? Color.white.opacity(0.1) : Color.clear)
                    .cornerRadius(8)
                    .onTapGesture {
                        selectedDate = date
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    func dayName(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: date)
    }
}