//
//  InsectDetailView.swift
//  Cross-Platform
//
//  Created by Edgar Nzokwe on 9/18/21.
//

import SwiftUI

struct InsectDetailView: View {
    var insect:Insect
    var body: some View {
        VStack{
            Text(insect.name)
                .font(.largeTitle)
            Image(insect.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Habitat")
                .font(.title)
            Text(insect.habitat)
            Text("Description")
                .font(.title)
                .padding()
            Text(insect.description)
            
            
        }
    }
}

struct InsectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InsectDetailView(insect: testInsect)
    }
}
