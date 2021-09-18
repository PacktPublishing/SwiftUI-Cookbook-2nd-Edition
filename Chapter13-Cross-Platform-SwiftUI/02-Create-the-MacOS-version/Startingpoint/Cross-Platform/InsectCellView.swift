
//
//  InsectCellView.swift
//  Cross-Platform
//
//  Created by Edgar Nzokwe on 6/8/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct InsectCellView: View {
    var insect:Insect
    var body: some View {
        HStack{
            Image(insect.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Rectangle())
                .frame(width:100, height: 80)
            
            VStack(alignment: .leading){
                Text(insect.name).font(.title)
                Text(insect.habitat)
            }.padding(.vertical)
        }
    }
}

struct InsectCellView_Previews: PreviewProvider {
    static var previews: some View {
        InsectCellView(insect: testInsect)
    }
}
