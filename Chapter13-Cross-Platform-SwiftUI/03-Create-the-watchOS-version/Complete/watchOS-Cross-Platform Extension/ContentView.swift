//
//  ContentView.swift
//  watchOS-Cross-Platform Extension
//
//  Created by Edgar Nzokwe on 6/15/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
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
