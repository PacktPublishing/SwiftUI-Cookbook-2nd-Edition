//
//  WatchInsectDetailView.swift
//  watchOS-Cross-Platform WatchKit Extension
//
//  Created by Edgar Nzokwe on 9/19/21.
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
