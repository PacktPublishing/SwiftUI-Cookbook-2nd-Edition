//
//  ContentView.swift
//  PresentingConfirmationDialog
//
//  Created by Edgar Nzokwe on 9/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showDialog = false
    var title  = "Confirmation Dialog"
    var body: some View {
        Button("Present Confirmation Dialog"){
                showDialog = true
        }.confirmationDialog(title, isPresented: $showDialog){
            Button("Dismiss Dialog", role: .destructive){
                //Add Dismiss Action here
            }
            Button("Save"){
                //Add Save action here
            }
            Button("Cancel", role: .cancel){}
            Button("Print something to console"){
                print("Print button clicked")
            }
        }message: {
            Text("""
                Use Dialogs to give users alternatives for completing a task
                """
            )
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
