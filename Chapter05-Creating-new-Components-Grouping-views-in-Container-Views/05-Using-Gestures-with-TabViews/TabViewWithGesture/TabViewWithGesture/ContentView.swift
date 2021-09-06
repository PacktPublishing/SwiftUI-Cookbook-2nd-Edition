//
//  ContentView.swift
//  TabViewWithGesture
//
//  Created by Edgar Nzokwe on 9/6/21.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected = 0
    var body: some View {
        TabView(selection: $tabSelected){
            Text("Left Tab. Click to switch to right")
                .onTapGesture {
                    self.tabSelected = 1
            }.tag(0)
                .tabItem{
                    Label("Left", systemImage: "l.circle.fill")
            }
            Text("Right Tab. Click to switch to left")
                .onTapGesture {
                        self.tabSelected = 0
                }
                .tabItem{
                    Label("Right",systemImage: "r.circle.fill")
            }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
