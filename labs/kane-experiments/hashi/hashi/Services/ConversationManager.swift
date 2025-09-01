import Foundation
import SwiftUI
import CoreData
import Combine
import ElevenLabs

@MainActor
class ConversationManager: ObservableObject {
    @Published var conversation: Conversation?
    @Published var isConnected = false
    @Published var currentMessage = ""
    @Published var configurationError: String?
    @Published var agentAudioLevel: Float = 0.0  // Track agent's voice level
    
    private var viewContext: NSManagedObjectContext?
    private var cancellables = Set<AnyCancellable>()
    
    // Use configuration for agent ID
    private var agentId: String {
        return ElevenLabsConfig.agentId
    }
    
    func setContext(_ context: NSManagedObjectContext) {
        self.viewContext = context
    }
    
    func startConversation() async {
        do {
            print("🔄 Starting ElevenLabs conversation...")
            print("📍 Using agent ID: \(agentId)")
            
            // Start conversation with public agent
            conversation = try await ElevenLabs.startConversation(
                agentId: agentId,
                config: ConversationConfig()
            )
            
            print("✅ Conversation object created: \(conversation != nil)")
            
            setupObservers()
            isConnected = true
            print("✅ Conversation connected!")
            
            // Make sure we're not muted
            if let conv = conversation {
                print("🎤 Initial mute status: \(conv.isMuted)")
                print("🎤 Conversation state: \(conv.state)")
                
                // Always try to unmute
                do {
                    try await conv.setMuted(false)
                    print("🔊 Successfully unmuted conversation")
                } catch {
                    print("❌ Failed to unmute: \(error)")
                }
                
                // Check mute status again
                print("🎤 Final mute status: \(conv.isMuted)")
            } else {
                print("❌ Conversation object is nil!")
            }
        } catch {
            print("❌ Failed to start conversation: \(error)")
            isConnected = false
        }
    }
    
    func endConversation() {
        Task {
            await conversation?.endConversation()
            await MainActor.run {
                conversation = nil
                isConnected = false
            }
        }
    }
    
    private func setupObservers() {
        guard let conversation else { return }
        
        // Monitor connection state
        conversation.$state
            .sink { [weak self] state in
                print("🔊 Conversation state changed: \(state)")
                // ConversationState is an enum with cases: idle, connecting, active, ended, error
                if case .active = state {
                    self?.isConnected = true
                    print("🎙️ Conversation is now ACTIVE - ready for voice!")
                } else {
                    self?.isConnected = false
                }
            }
            .store(in: &cancellables)
        
        // Handle tool calls from agent
        conversation.$pendingToolCalls
            .sink { [weak self] toolCalls in
                for toolCall in toolCalls {
                    Task {
                        await self?.handleToolCall(toolCall)
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    private func handleToolCall(_ toolCall: ClientToolCallEvent) async {
        print("🔧 Tool call received: \(toolCall.toolName)")
        do {
            let parameters = try toolCall.getParameters()
            print("📝 Parameters: \(parameters)")
            let resultString = await executeClientTool(
                name: toolCall.toolName,
                parameters: parameters
            )
            
            // Convert string result to dictionary for JSON serialization
            let resultDict = ["result": resultString]
            
            if toolCall.expectsResponse {
                try await conversation?.sendToolResult(
                    for: toolCall.toolCallId,
                    result: resultDict
                )
            } else {
                conversation?.markToolCallCompleted(toolCall.toolCallId)
            }
        } catch {
            if toolCall.expectsResponse {
                try? await conversation?.sendToolResult(
                    for: toolCall.toolCallId,
                    result: ["error": error.localizedDescription],
                    isError: true
                )
            }
        }
    }
    
    // Public test method for debugging
    func executeClientToolTest(name: String, parameters: [String: Any]) -> String {
        guard let context = viewContext else {
            return "Error: No CoreData context"
        }
        
        switch name {
        case "create_focus":
            return createFocus(parameters: parameters, context: context)
        default:
            return "Unknown tool: \(name)"
        }
    }
    
    private func executeClientTool(name: String, parameters: [String: Any]) async -> String {
        guard let context = viewContext else {
            return "Error: No CoreData context"
        }
        
        switch name {
        case "create_focus":
            return createFocus(parameters: parameters, context: context)
            
        case "create_task":
            return createTask(parameters: parameters, context: context)
            
        case "update_focus":
            return updateFocus(parameters: parameters, context: context)
            
        case "get_current_state":
            return getCurrentState(context: context)
            
        default:
            return "Unknown tool: \(name)"
        }
    }
    
    // Tool implementations
    private func createFocus(parameters: [String: Any], context: NSManagedObjectContext) -> String {
        print("🎯 Creating Focus...")
        
        // Check current focus count
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
        
        let focusRequest: NSFetchRequest<Focus> = Focus.fetchRequest()
        focusRequest.predicate = NSPredicate(format: "date >= %@ AND date < %@", today as NSDate, tomorrow as NSDate)
        
        do {
            let existingFocuses = try context.fetch(focusRequest)
            
            // Enforce 3 focus maximum
            if existingFocuses.count >= 3 {
                print("⚠️ Maximum focus limit reached (3)")
                return "Cannot create focus: Maximum of 3 focuses per day already reached. Consider completing or removing an existing focus first."
            }
            
            let title = parameters["title"] as? String ?? "Untitled"
            let contextText = parameters["context"] as? String ?? ""
            print("   Title: \(title)")
            print("   Context: \(contextText)")
            
            let focus = Focus(context: context)
            focus.id = UUID()
            focus.title = title
            focus.context = contextText
            focus.date = Date()
            focus.completed = false
            focus.createdAt = Date()
            
            try context.save()
            print("✅ Focus saved successfully!")
            return "Created focus: \(title) (Focus \(existingFocuses.count + 1)/3)"
        } catch {
            print("❌ Failed to save: \(error)")
            return "Failed to create focus: \(error.localizedDescription)"
        }
    }
    
    private func createTask(parameters: [String: Any], context: NSManagedObjectContext) -> String {
        let content = parameters["content"] as? String ?? "Untitled task"
        let isBlocker = parameters["is_blocker"] as? Bool ?? false
        let focusId = parameters["focus_id"] as? String
        
        let task = FocusTask(context: context)
        task.id = UUID()
        task.content = content
        task.isBlocker = isBlocker
        task.createdAt = Date()
        
        // Link to focus if ID provided
        if let focusIdString = focusId,
           let focusUUID = UUID(uuidString: focusIdString) {
            let request: NSFetchRequest<Focus> = Focus.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", focusUUID as CVarArg)
            if let focus = try? context.fetch(request).first {
                task.focus = focus
            }
        }
        
        do {
            try context.save()
            return "Created task: \(content)"
        } catch {
            return "Failed to create task: \(error.localizedDescription)"
        }
    }
    
    private func updateFocus(parameters: [String: Any], context: NSManagedObjectContext) -> String {
        guard let idString = parameters["id"] as? String,
              let focusId = UUID(uuidString: idString) else {
            return "Invalid focus ID"
        }
        
        let request: NSFetchRequest<Focus> = Focus.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", focusId as CVarArg)
        
        guard let focus = try? context.fetch(request).first else {
            return "Focus not found"
        }
        
        if let newTitle = parameters["title"] as? String {
            focus.title = newTitle
        }
        
        if let newContext = parameters["context"] as? String {
            focus.context = newContext
        }
        
        if let completed = parameters["completed"] as? Bool {
            focus.completed = completed
        }
        
        do {
            try context.save()
            return "Updated focus: \(focus.title ?? "")"
        } catch {
            return "Failed to update focus: \(error.localizedDescription)"
        }
    }
    
    private func getCurrentState(context: NSManagedObjectContext) -> String {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
        
        // Fetch today's focuses
        let focusRequest: NSFetchRequest<Focus> = Focus.fetchRequest()
        focusRequest.predicate = NSPredicate(format: "date >= %@ AND date < %@", today as NSDate, tomorrow as NSDate)
        
        // Fetch blocker tasks
        let taskRequest: NSFetchRequest<FocusTask> = FocusTask.fetchRequest()
        taskRequest.predicate = NSPredicate(format: "isBlocker == YES AND completedAt == nil")
        
        do {
            let focuses = try context.fetch(focusRequest)
            let blockers = try context.fetch(taskRequest)
            
            var state = "Current state:\n"
            state += "Today's priorities (\(focuses.count)):\n"
            for focus in focuses {
                state += "- \(focus.title ?? "Untitled"): \(focus.completed ? "✓" : "○")\n"
            }
            
            state += "\nBlockers (\(blockers.count)):\n"
            for task in blockers {
                state += "- \(task.content ?? "Untitled")\n"
            }
            
            return state
        } catch {
            return "Failed to fetch current state"
        }
    }
    
    private func getCurrentContext() -> String {
        guard let context = viewContext else {
            return "No context available."
        }
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
        
        // Fetch today's focuses
        let focusRequest: NSFetchRequest<Focus> = Focus.fetchRequest()
        focusRequest.predicate = NSPredicate(format: "date >= %@ AND date < %@", today as NSDate, tomorrow as NSDate)
        
        do {
            let focuses = try context.fetch(focusRequest)
            
            // Build context message
            var contextMessage = "CURRENT STATE:\n"
            
            // Rule: Maximum 3 focuses per day
            contextMessage += "Rule: Never create more than 3 focus items per day.\n"
            contextMessage += "Current focus count: \(focuses.count)/3\n\n"
            
            if !focuses.isEmpty {
                contextMessage += "Existing focuses for today:\n"
                for (index, focus) in focuses.enumerated() {
                    contextMessage += "\(index + 1). \(focus.title ?? "Untitled")"
                    if focus.completed {
                        contextMessage += " (completed)"
                    }
                    contextMessage += "\n"
                    if let context = focus.context, !context.isEmpty {
                        contextMessage += "   Context: \(context)\n"
                    }
                }
            } else {
                contextMessage += "No focuses created yet today.\n"
            }
            
            print("📝 Context for agent:\n\(contextMessage)")
            return contextMessage
        } catch {
            return "Error fetching current state."
        }
    }
}
