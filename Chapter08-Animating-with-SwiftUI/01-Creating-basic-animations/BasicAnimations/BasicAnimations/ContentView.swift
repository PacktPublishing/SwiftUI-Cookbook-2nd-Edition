//
//  ContentView.swift
//  BasicAnimations
//
//  Created by Giordano Scalzo on 05/07/2021.
//
import SwiftUI

struct AnimationType {
    let name: String
    let animation: Animation
    
    static var all: [AnimationType]  = [
        .init(name: "default", animation: .default),
        .init(name: "easeIn", animation: .easeIn),
        .init(name: "easeOut", animation: .easeOut),
        .init(name: "easeInOut", animation: .easeInOut),
        .init(name: "linear", animation: .linear),
        .init(name: "spring", animation: .spring()),
    ]
}

struct ContentView: View {
    @State
    var onTop = false
    @State
    var type =
    AnimationType(name: "default", animation: .default)
    @State
    var showSelection = false
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Animations"),
                    buttons: AnimationType
                        .all
                        .map { type in
                        .default(Text(type.name)) {
                            self.type = type
                        }
        } +
                    [ .destructive(Text("Cancel")) ]
        )
    }
    
    var body: some View {
        VStack(spacing: 12) {
            GeometryReader { geometry in
                HStack {
                    Circle()
                        .fill(.blue)
                        .frame(width: 80, height: 80)
                        .offset(y: onTop ?
                                -geometry.size.height/2 :
                                    geometry.size.height/2)
                        .animation(.default, value: onTop)
                    Spacer()
                    Circle()
                        .fill(.red)
                        .frame(width: 80, height: 80)
                        .offset(y: onTop ?
                                -geometry.size.height/2 :
                                    geometry.size.height/2 )
                        .animation(type.animation, value: onTop)
                }
                .padding(.horizontal, 30)
            }
            Button {
                onTop.toggle()                
            } label: {
                Text("Animate")
            }
            Button {
                showSelection.toggle()
            } label: {
                Text("Choose Animation")
            }
            .actionSheet(isPresented: $showSelection) {
                actionSheet
            }
            Text("Current: \(type.name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
