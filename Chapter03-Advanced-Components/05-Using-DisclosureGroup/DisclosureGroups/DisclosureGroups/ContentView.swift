//
//  ContentView.swift
//  DisclosureGroups
//
//  Created by Edgar Nzokwe on 8/2/21.
//

import SwiftUI


struct ContentView: View {
    @State private var showplanets = true
    var body: some View {
        VStack {
            DisclosureGroup("Planets", isExpanded: $showplanets){
                Text("Mercury")
                Text("Venus")
                
                DisclosureGroup("Earth"){
                    Text("North America")
                    Text("South America")
                    Text("Europe")
                    Text("Africa")
                    Text("Asia")
                    Text("Antarctica")
                    Text("Oceania")
                }
            }
            DisclosureGroup{
                Text("Surprise! This is an alternative way of using DisclosureGroup")
            } label : {
                Label("Tap to reveal", systemImage: "cube.box")
                    .font(.system(size:25, design: .rounded))
                    .foregroundColor(.blue)
            }
        }.padding()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
