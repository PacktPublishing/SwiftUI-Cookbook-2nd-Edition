//
//  Cross_PlatformApp.swift
//  watchOS-Cross-Platform WatchKit Extension
//
//  Created by Edgar Nzokwe on 9/19/21.
//

import SwiftUI

@main
struct Cross_PlatformApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
