//
//  ContentView.swift
//  UsingPickers
//
//  Created by Edgar Nzokwe on 7/18/21.
//

import SwiftUI

struct ContentView: View {
    @State var choice = 0
    @State var showText = false
    @State var transitModes = ["Bike", "Car", "Bus"]
    @State var sliderVal: Float = 0
    @State var stepVal = 0
    @State var gameTime = Date()
    var body: some View {
        Form{
            Section{
                Picker("Transit Modes", selection: $choice){
                    ForEach( 0 ..< transitModes.count) { index in
                        Text("\(self.transitModes[index])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                Text("Current choice: \(transitModes[choice])")
            }
            Section{
                Toggle(isOn: $showText){
                    Text("Show Text")
                }
                if showText {
                    Text("The Text toggle is on")
                }
            }
            Section{
                Slider(value: $sliderVal, in: 0...10, step: 0.001)
                Text("Slider current value \(sliderVal, specifier: "%.1f")")
            }
            Section {
                Stepper("Stepper", value: $stepVal, in: 0...5)
                Text("Stepper current value \(stepVal)")
            }
            Section {
                DatePicker("Please select a date", selection: $gameTime)
            }
            //Allow only Dates in the future
            Section {
                DatePicker("Please select a date", selection: $gameTime, in: Date()...)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
