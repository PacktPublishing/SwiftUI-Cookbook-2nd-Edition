//
//  SongPlayerApp.swift
//  SongPlayer
//
//  Created by Giordano Scalzo on 25/07/2021.
//

import SwiftUI

@main
struct SongPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MusicPlayer())
        }
    }
}
