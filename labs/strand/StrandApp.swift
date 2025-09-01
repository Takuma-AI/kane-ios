import SwiftUI
import CoreData

@main
struct StrandApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var conversationManager = ConversationManager()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(conversationManager)
                .preferredColorScheme(.dark)
        }
    }
}