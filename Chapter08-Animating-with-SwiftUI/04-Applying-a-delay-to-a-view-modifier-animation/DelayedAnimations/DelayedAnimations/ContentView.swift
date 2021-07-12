//
//  ContentView.swift
//  DelayedAnimations
//
//  Created by Giordano Scalzo on 05/07/2021.
//

import SwiftUI

struct ContentView: View {
    let duration = 1.0
    @State
    var change = false
    
    var body: some View {
        VStack(spacing: 30) {
            Rectangle()
                .fill(.blue)
                .offset(y: change ? -300 : 0)
                .animation(
                    .easeInOut(duration: duration).delay(0), value: change)
                .scaleEffect(change ? 0.5 : 1)
                .animation(
                    .easeInOut(duration: duration).delay(duration), value: change)
                .rotation3DEffect(
                    change ? .degrees(45) : .degrees(0),
                    axis: (x: 1, y: 0, z: 0))
                .animation(
                    .easeInOut(duration: duration).delay(2*duration), value: change)
                .frame(width: 200, height: 200)
            
            Button  {
                change.toggle()
            } label: {
                Text("Animate")
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                    .background(.green)
                    .cornerRadius(5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
