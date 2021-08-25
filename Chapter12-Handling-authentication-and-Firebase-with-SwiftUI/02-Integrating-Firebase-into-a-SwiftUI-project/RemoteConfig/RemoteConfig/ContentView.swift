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

    private var remoteConfig: Firebase.RemoteConfig {
        Firebase.RemoteConfig.remoteConfig()
    }

    init() {
        // Configure in developer mode
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        refreshConfig()
    }

    private func refreshConfig() {
        let expirationDuration = 1
        remoteConfig.fetch(withExpirationDuration: TimeInterval(expirationDuration)) { [weak self] (status, error) -> Void in
            guard status == .success else {
                return
            }
            self?.remoteConfig.fetchAndActivate {  _, _ in
                DispatchQueue.main.async {
                    self?.setProperties()
                }
            }
        }
    }

    private func setProperties() {
        activeScreen = remoteConfig["screenType"].stringValue ?? "screenA"
    }
}

struct ContentView: View {
    @ObservedObject
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
