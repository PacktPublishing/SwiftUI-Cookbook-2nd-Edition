//
//  FirebaseNotesApp.swift
//  FirebaseNotes
//
//  Created by Giordano Scalzo on 26/08/2021.
//

import SwiftUI
import Firebase

@main
struct FirebaseNotesApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
