import SwiftUI

struct GlassmorphicModal: View {
    @Binding var isPresented: Bool
    let focus: Focus?
    let task: FocusTask?
    @State private var dragOffset: CGSize = .zero
    @State private var scale: CGFloat = 0.9
    @State private var opacity: Double = 0
    
    // Navigation stack state
    @State private var navigationStack: [(focus: Focus?, task: FocusTask?)] = []
    @State private var currentFocus: Focus?
    @State private var currentTask: FocusTask?
    
    private var canGoBack: Bool {
        !navigationStack.isEmpty
    }
    
    var body: some View {
        ZStack {
            // Background dimming
            Color.black.opacity(0.4 * opacity)
                .ignoresSafeArea()
                .onTapGesture {
                    dismissModal()
                }
            
            // Modal content
            VStack(spacing: 0) {
                // Drag indicator and close button
                ZStack {
                    // Drag indicator
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.white.opacity(0.3))
                        .frame(width: 40, height: 4)
                        .padding(.top, 8)
                    
                    HStack {
                        // Back button
                        if canGoBack {
                            Button(action: {
                                navigateBack()
                            }) {
                                HStack(spacing: 4) {
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 12, weight: .medium))
                                    Text("Back")
                                        .font(.system(size: 14, weight: .medium))
                                }
                                .foregroundColor(.white.opacity(0.7))
                            }
                            .padding(.leading)
                            .padding(.top, 12)
                        }
                        
                        Spacer()
                        
                        // Close button
                        Button(action: {
                            dismissModal()
                        }) {
                            ZStack {
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 28, height: 28)
                                
                                Image(systemName: "xmark")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white.opacity(0.6))
                            }
                        }
                        .padding(.trailing)
                        .padding(.top, 12)
                    }
                }
                
                // Content
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        if let focus = currentFocus ?? focus {
                            FocusDetailView(focus: focus, onNavigate: navigateToItem)
                        } else if let task = currentTask ?? task {
                            TaskDetailView(task: task, onNavigate: navigateToItem)
                        }
                    }
                    .padding()
                }
                .animation(.easeInOut(duration: 0.2), value: currentFocus?.id)
                .animation(.easeInOut(duration: 0.2), value: currentTask?.id)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                ZStack {
                    // Glass layers
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(.ultraThinMaterial)
                    
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.1),
                                    Color.white.opacity(0.05)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    // Border
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .strokeBorder(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.3),
                                    Color.white.opacity(0.1)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .offset(y: max(0, dragOffset.height))
            .scaleEffect(scale)
            .opacity(opacity)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.translation.height > 0 {
                            dragOffset = value.translation
                        }
                    }
                    .onEnded { value in
                        if value.translation.height > 100 {
                            dismissModal()
                        } else {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                dragOffset = .zero
                            }
                        }
                    }
            )
            .padding(.top, 60)
            .ignoresSafeArea(.container, edges: .bottom)
        }
        .onAppear {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                scale = 1.0
                opacity = 1.0
            }
        }
    }
    
    private func dismissModal() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            scale = 0.9
            opacity = 0
            dragOffset = CGSize(width: 0, height: 300)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isPresented = false
        }
    }
    
    private func navigateToItem(focus: Focus? = nil, task: FocusTask? = nil) {
        // Push current state to navigation stack
        navigationStack.append((currentFocus ?? self.focus, currentTask ?? self.task))
        
        // Update current state with animation
        withAnimation(.easeInOut(duration: 0.2)) {
            currentFocus = focus
            currentTask = task
        }
    }
    
    private func navigateBack() {
        guard let previous = navigationStack.popLast() else { return }
        
        withAnimation(.easeInOut(duration: 0.2)) {
            currentFocus = previous.focus
            currentTask = previous.task
        }
    }
}

struct FocusDetailView: View {
    let focus: Focus
    var onNavigate: (Focus?, FocusTask?) -> Void = { _, _ in }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Title
            Text(focus.title ?? "Untitled")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Context (directly under title, no card)
            if let context = focus.context, !context.isEmpty {
                Text(context)
                    .font(.system(size: 18))
                    .foregroundColor(.white.opacity(0.8))
                    .lineSpacing(6)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            // Created date (subtle, lighter)
            Text("Created \(formatDate(focus.createdAt))")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.4))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 8)
            
            // Associated tasks (if any)
            if let tasks = focus.tasks as? Set<FocusTask>, !tasks.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    Divider()
                        .background(Color.white.opacity(0.1))
                        .padding(.vertical, 8)
                    
                    ForEach(Array(tasks).sorted { $0.createdAt < $1.createdAt }) { task in
                        Button(action: {
                            onNavigate(nil, task)
                        }) {
                            HStack {
                                Image(systemName: task.completedAt != nil ? "checkmark.circle.fill" : "circle")
                                    .font(.system(size: 16))
                                    .foregroundColor(task.completedAt != nil ? .green.opacity(0.7) : .white.opacity(0.3))
                                
                                Text(task.content ?? "")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white.opacity(0.7))
                                    .strikethrough(task.completedAt != nil)
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white.opacity(0.2))
                            }
                            .padding(.vertical, 6)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct TaskDetailView: View {
    let task: FocusTask
    var onNavigate: (Focus?, FocusTask?) -> Void = { _, _ in }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Content
            Text(task.content ?? "Untitled Task")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Simple completion indicator
            if task.completedAt != nil {
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green.opacity(0.7))
                        .font(.system(size: 18))
                    
                    Text("Completed")
                        .font(.system(size: 16))
                        .foregroundColor(.green.opacity(0.7))
                }
            }
            
            // AI Progress
            if let aiProgress = task.aiProgress, !aiProgress.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("AI PROGRESS")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.white.opacity(0.5))
                        .tracking(1.2)
                    
                    Text(aiProgress)
                        .font(.system(size: 14))
                        .foregroundColor(.cyan.opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.cyan.opacity(0.1))
                )
            }
            
            // Parent focus
            if let focus = task.focus {
                Button(action: {
                    onNavigate(focus, nil)
                }) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("PART OF")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundColor(.white.opacity(0.5))
                                .tracking(1.2)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.3))
                        }
                        
                        Text(focus.title ?? "Untitled Focus")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white.opacity(0.9))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.05))
                    )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}