import CoreData
import Foundation

// Focus/Milestone entity
extension Focus {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Focus> {
        return NSFetchRequest<Focus>(entityName: "Focus")
    }
    
    @NSManaged public var id: UUID
    @NSManaged public var title: String?
    @NSManaged public var context: String?
    @NSManaged public var date: Date
    @NSManaged public var completed: Bool
    @NSManaged public var createdAt: Date
    @NSManaged public var tasks: NSSet?
}

// Task entity
extension Task {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }
    
    @NSManaged public var id: UUID
    @NSManaged public var content: String?
    @NSManaged public var isBlocker: Bool
    @NSManaged public var aiProgress: String?
    @NSManaged public var completedAt: Date?
    @NSManaged public var createdAt: Date
    @NSManaged public var focus: Focus?
}

// Persistence Controller
class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "StrandModel")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}