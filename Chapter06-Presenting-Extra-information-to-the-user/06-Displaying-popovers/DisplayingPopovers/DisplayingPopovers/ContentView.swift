//
//  ContentView.swift
//  DisplayingPopovers
//
//  Created by Edgar Nzokwe on 9/17/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showPopover = false
    var body: some View {
        Button(action: {
            self.showPopover = true
        }){
            Text("Show popover").font(.system(size: 40))
        }.popover(
            isPresented: self.$showPopover,
            arrowEdge: .bottom
        ) {
            Text("Popover content displayed here")
            .font(.system(size: 40))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
