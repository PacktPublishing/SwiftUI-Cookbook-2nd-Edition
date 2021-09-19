//
//  ContentView.swift
//  watchOS-Cross-Platform WatchKit Extension
//
//  Created by Edgar Nzokwe on 9/19/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        InsectListView{WatchInsectDetailView(insect: $0) }
        .environmentObject(InsectData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(InsectData())
    }
}

