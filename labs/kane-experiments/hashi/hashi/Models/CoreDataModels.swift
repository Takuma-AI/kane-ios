import CoreData
import Foundation

// IMPORTANT: In Xcode, set both entities' Codegen to "Manual/None" in the Data Model Inspector
// Entity names in Core Data: "Focus" and "Task"
// Class names in Swift: "Focus" and "FocusTask" (to avoid conflict with Swift.Task)

@objc(Focus)
public class Focus: NSManagedObject, Identifiable {
    // Core Data will use the 'id' property for Identifiable conformance
}

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

@objc(FocusTask)
public class FocusTask: NSManagedObject, Identifiable {
    // Core Data will use the 'id' property for Identifiable conformance
}

extension FocusTask {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FocusTask> {
        return NSFetchRequest<FocusTask>(entityName: "Task")
    }
    
    @NSManaged public var id: UUID
    @NSManaged public var content: String?
    @NSManaged public var isBlocker: Bool
    @NSManaged public var aiProgress: String?
    @NSManaged public var completedAt: Date?
    @NSManaged public var createdAt: Date
    @NSManaged public var focus: Focus?
}

// MARK: - Persistence Controller

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "hashi")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}