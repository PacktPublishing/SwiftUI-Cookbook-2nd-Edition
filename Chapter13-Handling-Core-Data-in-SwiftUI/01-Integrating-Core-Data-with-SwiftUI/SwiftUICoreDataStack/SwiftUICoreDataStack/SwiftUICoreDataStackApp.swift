//
//  SwiftUICoreDataStackApp.swift
//  SwiftUICoreDataStack
//
//  Created by Giordano Scalzo on 01/09/2021.
//

import SwiftUI

@main
struct SwiftUICoreDataStackApp: App {
    private let coreDataStack = CoreDataStack(modelName: "ContactsModel")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                             coreDataStack.managedObjectContext)
        }
    }
}
