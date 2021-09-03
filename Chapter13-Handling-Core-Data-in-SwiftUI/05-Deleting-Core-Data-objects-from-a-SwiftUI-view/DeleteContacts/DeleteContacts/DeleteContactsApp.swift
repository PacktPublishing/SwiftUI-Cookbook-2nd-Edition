//
//  DeleteContactsApp.swift
//  DeleteContacts
//
//  Created by Giordano Scalzo on 03/09/2021.
//

import SwiftUI

@main
struct DeleteContactsApp: App {
    private let coreDataStack = CoreDataStack(modelName: "ContactsModel")
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              coreDataStack.managedObjectContext)
                .onAppear {
                    addContacts(to: coreDataStack)
                }
        }
        .onChange(of: scenePhase) { _ in
            coreDataStack.save()
        }
    }
}
