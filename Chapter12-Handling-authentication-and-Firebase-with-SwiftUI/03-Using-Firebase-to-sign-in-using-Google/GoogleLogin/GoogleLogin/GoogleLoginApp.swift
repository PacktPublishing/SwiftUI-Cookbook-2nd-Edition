//
//  GoogleLoginApp.swift
//  GoogleLogin
//
//  Created by Giordano Scalzo on 25/08/2021.
//

import SwiftUI
import Firebase

@main
struct GoogleLoginApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
