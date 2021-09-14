//
//  ContentView.swift
//  DisplayingContextMenus
//
//  Created by Edgar Nzokwe on 9/13/21.
//

import SwiftUI

struct ContentView: View {
    @State private var bulbColor = Color.red
    var body: some View {
        Image(systemName: "lightbulb.fill")
            .font(.system(size: 60))
            .foregroundColor(bulbColor)
          .contextMenu{
              
            Button("Yellow Bulb"){
                self.bulbColor = Color.yellow
            }
            Button("Blue Bulb"){
                self.bulbColor = Color.blue
            }
            Button("Green Bulb"){
                self.bulbColor = Color.green
            }
      }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
