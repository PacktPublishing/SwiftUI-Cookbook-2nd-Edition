//
//  CoreDataStack.swift
//  CoreDataStack
//
//  Created by Giordano Scalzo on 02/09/2021.
//

import Foundation
import CoreData

class CoreDataStack: ObservableObject {
    private let persistentContainer: NSPersistentContainer
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    init(modelName: String) {
        persistentContainer = {
            let container = NSPersistentContainer(name: modelName)
            container.loadPersistentStores { description, error in
                if let error = error {
                    print(error)
                }
            }
            return container
        }()
    }

    func save () {
        guard managedObjectContext.hasChanges else { return }
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
    }
    
    func insertContact(firstName: String,
                       lastName: String,
                       phoneNumber: String) {
        let contact = Contact(context: managedObjectContext)
        contact.firstName = firstName
        contact.lastName = lastName
        contact.phoneNumber = phoneNumber
    }
}
