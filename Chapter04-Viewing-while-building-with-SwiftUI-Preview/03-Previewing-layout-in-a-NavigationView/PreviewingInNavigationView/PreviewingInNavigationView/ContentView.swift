//
//  ContentView.swift
//  PreviewingInNavigationView
//
//  Created by Edgar Nzokwe on 8/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView(someText: "Sample text")){
                    Text("Go to second view")
                    .foregroundColor(Color.white)
                    .padding()
                        .background(Color.black)
                    .cornerRadius(25)
                }
            }.navigationBarTitle("Previews", displayMode: .inline)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

