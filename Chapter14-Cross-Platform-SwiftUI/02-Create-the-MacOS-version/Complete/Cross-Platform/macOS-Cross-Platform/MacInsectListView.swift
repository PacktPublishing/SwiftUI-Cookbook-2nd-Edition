//
//  MacInsectListView.swift
//  macOS-Cross-Platform
//
//  Created by Edgar Nzokwe on 9/18/21.
//

import SwiftUI


struct MacInsectListView: View {
    @EnvironmentObject var insectData: InsectData
    @Binding var selectedInsect: Insect?
    var body: some View {
        List(selection: $selectedInsect){
            ForEach(insectData.insects){ insect in
                MacInsectCellView(insect: insect).tag(insect)
            }
        }.listStyle(SidebarListStyle())
    }
}

struct MacInsectListView_Previews: PreviewProvider {
    static var previews: some View {
         MacInsectListView(selectedInsect: .constant(testInsect)).environmentObject(InsectData())
    }
}
