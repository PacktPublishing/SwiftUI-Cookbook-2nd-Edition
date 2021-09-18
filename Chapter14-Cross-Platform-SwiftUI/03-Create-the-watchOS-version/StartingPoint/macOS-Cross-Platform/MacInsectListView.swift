//
//  MacInsectListView.swift
//  macOS-Cross-Platform
//
//  Created by Edgar Nzokwe on 6/14/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
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
