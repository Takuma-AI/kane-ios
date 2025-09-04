import SwiftUI
import CoreData

@main
struct kaneApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var conversationManager = ConversationManager()
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(conversationManager)
                .preferredColorScheme(.dark)
                .onAppear {
                    conversationManager.setContext(persistenceController.container.viewContext)
                }
        }
    }
}
