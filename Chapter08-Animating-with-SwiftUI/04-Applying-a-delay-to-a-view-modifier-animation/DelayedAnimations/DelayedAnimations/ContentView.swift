//
//  ContentView.swift
//  DelayedAnimations
//
//  Created by Giordano Scalzo on 05/07/2021.
//

import SwiftUI

struct ContentView: View {
    @State
    var change = false
    
    var body: some View {
        VStack(spacing: 30) {
            Rectangle()
                .fill(.blue)
            
                .offset(y: change ? -300 : 0)
                .animation(
                    .easeInOut(duration: 1)
                        .delay(0), value: change)
            
                .scaleEffect(change ? 0.5 : 1)
                .animation(
                    .easeInOut(duration: 1)
                        .delay(1), value: change)
            
                .rotation3DEffect(
                    change ? .degrees(45) : .degrees(0),
                    axis: (x: 1, y: 0, z: 0))
                .animation(
                    .easeInOut(duration: 1)
                        .delay(2), value: change)
            
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
