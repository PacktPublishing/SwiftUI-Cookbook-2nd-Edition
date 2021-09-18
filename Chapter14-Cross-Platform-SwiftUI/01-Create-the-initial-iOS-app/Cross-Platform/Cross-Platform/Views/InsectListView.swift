//
//  InsectListView.swift
//  Cross-Platform
//
//  Created by Edgar Nzokwe on 9/18/21.
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
