//
//  ContentView.swift
//  UsingViewModifiers
//
//  Created by Edgar Nzokwe on 7/18/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    Text("Perfect")
        .backgroundStyle(color: Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundStyle: ViewModifier {
    var bgColor: Color
    func body(content: Content) -> some View{
        content
        .frame(width:UIScreen.main.bounds.width * 0.3)
        .foregroundColor(Color.black)
        .padding()
        .background(bgColor)
        .cornerRadius(CGFloat(20))
    }
}

extension View {
    func backgroundStyle(color: Color) -> some View{
        self.modifier(BackgroundStyle(bgColor: color))
    }
}
