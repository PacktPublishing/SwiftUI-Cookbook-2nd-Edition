//
//  ContentView.swift
//  DelayedAnimations
//
//  Created by Giordano Scalzo on 05/07/2021.
//

import SwiftUI

struct CustomText: ViewModifier {
    let foreground: Color
    let background: Color
    let cornerRadius: Double
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(foreground)
            .frame(width: 200)
            .padding()
            .background(background)
            .cornerRadius(cornerRadius)
    }
}

struct ContentView: View {
    @State var hideFirst = true
    @State var hideSecond = true
    @State var hideThird = true
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                Text("First")
                .modifier(CustomText(foreground: .white,
                                     background: .red,
                                     cornerRadius: 10))
                    .opacity(hideFirst ? 0 : 1)
            Text("Second")
                .modifier(CustomText(foreground: .white,
                                     background: .blue,
                                     cornerRadius: 10))
                .opacity(hideSecond ? 0 : 1)

            Text("Third")
                .modifier(CustomText(foreground: .white,
                                     background: .yellow,
                                     cornerRadius: 10))
                .opacity(hideThird ? 0 : 1)
            }
            
            Spacer()
            Button  {
                withAnimation(Animation.easeInOut) {
                    hideFirst.toggle()
                }
                withAnimation(Animation.easeInOut.delay(0.3)) {
                    hideSecond.toggle()
                }
                withAnimation(Animation.easeInOut.delay(0.6)) {
                    hideThird.toggle()
                }
            } label: {
                Text("Animate")
                    .fontWeight(.heavy)
                    .modifier(CustomText(foreground: .white,
                                         background: .green,
                                         cornerRadius: 5))
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
