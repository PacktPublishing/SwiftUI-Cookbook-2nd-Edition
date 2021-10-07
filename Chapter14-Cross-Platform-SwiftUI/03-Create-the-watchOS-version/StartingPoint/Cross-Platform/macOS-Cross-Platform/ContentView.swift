//
//  ContentView.swift
//  macOS-Cross-Platform
//
//  Created by Edgar Nzokwe on 9/18/21.
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
            if let selectedInsect = selectedInsect {
                ScrollView{
                    InsectDetailView(insect: selectedInsect)
                }
            }else{
                EmptyView()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(InsectData())
    }
}
