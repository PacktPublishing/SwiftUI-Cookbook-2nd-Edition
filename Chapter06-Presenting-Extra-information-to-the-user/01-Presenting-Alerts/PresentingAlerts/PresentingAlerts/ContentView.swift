//
//  ContentView.swift
//  PresentingAlerts
//
//  Created by Edgar Nzokwe on 9/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showSubmitAlert = false;
    var body: some View {
        Button(action: {
            self.showSubmitAlert=true
        }){

            Text("Show alert")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
        .alert(isPresented: $showSubmitAlert ){
            Alert(title: Text("Confirm Action"),
                  message: Text("Are you sure you want to submit the form"),
                  dismissButton: .default(Text("OK"))
            )

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
