//
//  ContentView.swift
//  DarkModePreview
//
//  Created by Edgar Nzokwe on 8/21/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var deviceColorScheme
    
    var body: some View {
        NavigationView {
            Text(deviceColorScheme == .dark ? "Quick journey to the dark side" : "Back to the light")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().colorScheme(.dark)
            ContentView().colorScheme(.light)
        }
    }
}
