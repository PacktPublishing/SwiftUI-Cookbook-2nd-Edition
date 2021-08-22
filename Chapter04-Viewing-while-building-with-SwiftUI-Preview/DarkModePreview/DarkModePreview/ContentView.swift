//
//  ContentView.swift
//  DarkModePreview
//
//  Created by Edgar Nzokwe on 8/21/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Quick journey to the dark side")
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
