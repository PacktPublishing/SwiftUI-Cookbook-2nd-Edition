//
//  ContentView.swift
//  MoreViewsAndControls
//
//  Created by Edgar Nzokwe on 7/19/21.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.5
    @State private var color  = Color.red
    @State private var secondColor  = Color.yellow
    @State private var someText = "Initial value"
    var body: some View {
        List{
            Section(header: Text("ProgressViews")) {
                ProgressView("Indeterminate progress view")
                ProgressView("Downloading",value: progress, total:2)
                Button("More"){
                    if(progress < 2){
                        progress += 0.5
                    }
                    
                }
            }
            Section(header: Text("Labels")) {
                Label("Slow ", systemImage: "tortoise.fill")
                Label{
                    Text ("Fast")
                        .font(.title)
                }
                icon: {
                    Circle()
                        .fill(Color.orange)
                           .frame(width: 40, height: 20, alignment: .center)
                           .overlay(Text("F"))
                }
            }
            Section(header: Text("ColorPicker")) {
                ColorPicker(selection: $color ){
                    Text("Pick my background")
                        .background(color)
                        .padding()
                }
                ColorPicker("Picker", selection: $secondColor )
            }
            Section(header: Text("Link")) {
                Link("Packt Publishing", destination: URL(string: "https://www.packtpub.com/")!)
            }
            Section(header: Text("TextEditor")) {
                TextEditor(text: $someText)
                Text("current editor text:\n\(someText)")
            }
            Section(header: Text("Menu")) {
                Menu("Actions") {
                    Button("Set TextEditor text to 'magic'"){
                        someText = "magic"
                    }
                    Button("Turn first picker green") {
                        color = Color.green
                    }
                    Menu("Actions") {
                        Button("Set TextEditor text to 'magic'"){
                            someText = "magic"
                        }
                        Button("Turn first picker green") {
                            color = Color.green
                        }
                        
                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
