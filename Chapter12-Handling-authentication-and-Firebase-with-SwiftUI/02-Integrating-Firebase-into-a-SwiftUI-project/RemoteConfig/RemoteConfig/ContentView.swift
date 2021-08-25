//
//  ContentView.swift
//  RemoteConfig
//
//  Created by Giordano Scalzo on 25/08/2021.
//

import SwiftUI
import Firebase

class RemoteConfig: ObservableObject {
    @Published
    var activeScreen = "screenA"

    private var remoteConfig = Firebase.RemoteConfig.remoteConfig()

    init() {
        // Configure in developer mode
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }

   func refreshConfig() async {
        guard let status = try? await remoteConfig.fetch(withExpirationDuration: 1) else {
            return
        }
        
        guard case .success = status else {
            return
        }
        
        await update()
    }
    
    @MainActor func update()  {
        activeScreen = remoteConfig["screenType"].stringValue ?? "screenA"
    }
}

struct ContentView: View {
    @StateObject
    private var remoteConfig = RemoteConfig()

    var body: some View {
        VStack {
            Text("This is the Screen")
                .font(.system(size: 50))
            if remoteConfig.activeScreen == "screenA" {
                Text("A")
                    .font(.system(size: 100))
            } else {
                Text("B")
                    .font(.system(size: 100))
            }
        }
        .task {
            await remoteConfig.refreshConfig()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
