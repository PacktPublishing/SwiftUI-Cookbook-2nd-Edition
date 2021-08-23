//
//  ContentView.swift
//  PreviewOnDifferentDevices
//
//  Created by Edgar Nzokwe on 8/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
          VStack{
                Image("friendship")
                    .resizable()
                  .aspectRatio(contentMode: .fit)
                Text("Importance of Friendship").font(.title)
                Text("Friends helps us deal with stress and make better life choices").multilineTextAlignment(.center).padding()
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11 Pro Max")
                .previewDisplayName("Iphone 11 Pro Max")
            ContentView()
                .previewDevice("iPhone 8")
                .previewDisplayName("iPhone 8")
            ContentView()
                .previewLayout(.fixed(width: 568, height: 320))
                .previewDisplayName("Custom Size to infer landscape mode")
        }
    }
}
