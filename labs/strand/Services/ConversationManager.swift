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
    
    private var viewContext: NSManagedObjectContext?
    private var cancellables = Set<AnyCancellable>()
    
    // Replace with your agent ID
    private let agentId = "YOUR_AGENT_ID"
    
    func setContext(_ context: NSManagedObjectContext) {
        self.viewContext = context
    }
    
    func startConversation() async {
        do {
            conversation = try await ElevenLabs.startConversation(
                agentId: agentId,
                config: ConversationConfig()
            )
            
            setupObservers()
            isConnected = true
        } catch {
            print("Failed to start conversation: \(error)")
            isConnected = false
        }
    }
    
    func endConversation() {
        conversation?.endConversation()
        conversation = nil
        isConnected = false
    }
    
    private func setupObservers() {
        guard let conversation else { return }
        
        // Monitor connection state
        conversation.$state
            .sink { [weak self] state in
                self?.isConnected = (state == .connected)
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
        do {
            let parameters = try toolCall.getParameters()
            let result = await executeClientTool(
                name: toolCall.toolName,
                parameters: parameters
            )
            
            if toolCall.expectsResponse {
                try await conversation?.sendToolResult(
                    for: toolCall.toolCallId,
                    result: result
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
    
    private func executeClientTool(name: String, parameters: [String: Any]) async -> String {
        guard let context = viewContext else {
            return "Error: No CoreData context"
        }
        
        switch name {
        case "create_focus":
            return createFocus(parameters: parameters, context: context)
            
        // Start with just one tool for testing
        // case "create_task":
        //     return createTask(parameters: parameters, context: context)
        // case "update_focus":
        //     return updateFocus(parameters: parameters, context: context)
        // case "get_current_state":
        //     return getCurrentState(context: context)
            
        default:
            return "Unknown tool: \(name)"
        }
    }
    
    // Tool implementations
    private func createFocus(parameters: [String: Any], context: NSManagedObjectContext) -> String {
        let title = parameters["title"] as? String ?? "Untitled"
        let contextText = parameters["context"] as? String ?? ""
        
        let focus = Focus(context: context)
        focus.id = UUID()
        focus.title = title
        focus.context = contextText
        focus.date = Date()
        focus.completed = false
        focus.createdAt = Date()
        
        do {
            try context.save()
            return "Created focus: \(title)"
        } catch {
            return "Failed to create focus: \(error.localizedDescription)"
        }
    }
    
    private func createTask(parameters: [String: Any], context: NSManagedObjectContext) -> String {
        let content = parameters["content"] as? String ?? "Untitled task"
        let isBlocker = parameters["is_blocker"] as? Bool ?? false
        let focusId = parameters["focus_id"] as? String
        
        let task = Task(context: context)
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
        let taskRequest: NSFetchRequest<Task> = Task.fetchRequest()
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
}