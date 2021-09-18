//
//  InsectListView.swift
//  Cross-Platform
//
//  Created by Edgar Nzokwe on 6/8/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct InsectListView: View {
    @EnvironmentObject var insectData: InsectData
    var body: some View {
        List{
            ForEach(insectData.insects){insect in
                NavigationLink(
                destination: InsectDetailView(insect: insect)){
                    InsectCellView(insect: insect)
                }
            }
        }.navigationBarTitle("Insects",displayMode: .inline)
    }
}

struct InsectListView_Previews: PreviewProvider {
    static var previews: some View {
        InsectListView().environmentObject(InsectData())
    }
}
