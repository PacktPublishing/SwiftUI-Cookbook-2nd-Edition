//
//  WatchInsectDetailView.swift
//  watchOS-Cross-Platform Extension
//
//  Created by Edgar Nzokwe on 6/16/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct WatchInsectDetailView: View {
    var insect:Insect
    var body: some View {
        VStack{
            Text(insect.name)
            Image(insect.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            HStack {
                Text("Habitat")
                Text(insect.habitat)
            }
        }
    }
}

struct WatchInsectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WatchInsectDetailView(insect: testInsect)
    }
}
