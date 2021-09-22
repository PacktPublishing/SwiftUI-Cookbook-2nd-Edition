//
//  RestaurantMenuApp.swift
//  RestaurantMenu
//
//  Created by Giordano Scalzo on 16/09/2021.
//

import SwiftUI

@main
struct RestaurantMenuApp: App {
    private func loadFonts(withExtension ext: String) {
        let fonts = Bundle.main.urls(forResourcesWithExtension: ext,
                                        subdirectory: nil)
        fonts?.forEach { url in
            print(url)
            var errorRef: Unmanaged<CFError>?
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
            if let errorRef = errorRef {
                let error = errorRef.takeRetainedValue()
                print(error)
            }
        }
    }
    
    init() {
        loadFonts(withExtension: "ttf")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
