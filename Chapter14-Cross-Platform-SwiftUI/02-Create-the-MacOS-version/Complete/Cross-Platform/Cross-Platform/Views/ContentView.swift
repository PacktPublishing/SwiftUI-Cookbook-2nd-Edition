//
//  ContentView.swift
//  Cross-Platform
//
//  Created by Edgar Nzokwe on 9/18/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var insectData: InsectData
    var body: some View {
        NavigationView{
            InsectListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(InsectData())
    }
}
