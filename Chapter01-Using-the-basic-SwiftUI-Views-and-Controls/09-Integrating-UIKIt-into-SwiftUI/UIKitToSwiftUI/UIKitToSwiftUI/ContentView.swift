//
//  ContentView.swift
//  UIKitToSwiftUI
//
//  Created by Edgar Nzokwe on 7/18/21.
//

import SwiftUI

struct ContentView: View {
    @State var animate = true
    var body: some View {
        VStack{
            ActivityIndicator(animating:  animate)
            HStack{
                Toggle(isOn: $animate){
                    Text("Toggle Activity")
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
