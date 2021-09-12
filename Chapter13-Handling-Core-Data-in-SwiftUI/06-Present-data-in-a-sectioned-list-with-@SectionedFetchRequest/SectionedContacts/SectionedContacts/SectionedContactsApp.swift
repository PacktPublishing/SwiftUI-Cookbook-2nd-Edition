//
//  SectionedContactsApp.swift
//  SectionedContacts
//
//  Created by Giordano Scalzo on 04/09/2021.
//

import SwiftUI

@main
struct SectionedContactsApp: App {
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
