//
//  ContentView.swift
//  macOS-Cross-Platform
//
//  Created by Edgar Nzokwe on 6/14/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State  var selectedInsect: Insect?
    @EnvironmentObject var userData: InsectData
    var body: some View {
        NavigationView{
            VStack{
                MacInsectListView(selectedInsect: $selectedInsect)
            }.frame(minWidth: 250, maxWidth: 400)
            if selectedInsect != nil  {
                ScrollView{
                    InsectDetailView(insect: selectedInsect!)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(InsectData())
    }
}
