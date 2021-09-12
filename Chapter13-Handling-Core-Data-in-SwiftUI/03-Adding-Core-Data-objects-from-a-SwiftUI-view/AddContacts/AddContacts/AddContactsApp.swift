//
//  AddContactsApp.swift
//  AddContacts
//
//  Created by Giordano Scalzo on 02/09/2021.
//

import SwiftUI

@main
struct AddContactsApp: App {
    private let coreDataStack = CoreDataStack(modelName: "ContactsModel")
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coreDataStack)
                .environment(\.managedObjectContext,
                             coreDataStack.managedObjectContext)
        }
        .onChange(of: scenePhase) { _ in
            coreDataStack.save()
        }
    }
}
