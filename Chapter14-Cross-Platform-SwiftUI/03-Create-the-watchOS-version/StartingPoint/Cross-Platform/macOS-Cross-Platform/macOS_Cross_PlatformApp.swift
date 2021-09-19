//
//  macOS_Cross_PlatformApp.swift
//  macOS-Cross-Platform
//
//  Created by Edgar Nzokwe on 9/18/21.
//

import SwiftUI

@main
struct macOS_Cross_PlatformApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(InsectData())
        }
    }
}
