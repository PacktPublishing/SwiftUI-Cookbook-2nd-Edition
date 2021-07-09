//
//  ContentView.swift
//  Rhombus
//
//  Created by Giordano Scalzo on 30/06/2021.
//

import SwiftUI

struct Rhombus: Shape {
    func path(in rect: CGRect) -> Path {
        Path() { path in
            path.move(to: CGPoint(x: rect.midX,
                                  y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX,
                                     y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX,
                                     y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX,
                                     y: rect.midY))
            path.closeSubpath()
        }
    }
}

struct ContentView: View {
    var body: some View {
        Rhombus()
            .fill(.orange)
            .aspectRatio(0.7,
                         contentMode: .fit)
            .padding(.horizontal, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
