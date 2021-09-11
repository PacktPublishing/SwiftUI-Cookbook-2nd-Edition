//
//  ContentView.swift
//  AlertsWithActions
//
//  Created by Edgar Nzokwe on 9/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var changeText = false
    @State private var displayedText = "Tap to Change Text"
    var alertTitle = "ChangingText"
    var body: some View {
        Button(displayedText){
            changeText = true
        }.alert(alertTitle, isPresented: $changeText){ 
            Button("Yea"){
                displayedText = (displayedText == "Stay Foolish") ? "Stay Hungry" : "Stay Foolish"
            }
        }message: {
            Text("Do you want to toggle the text")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
