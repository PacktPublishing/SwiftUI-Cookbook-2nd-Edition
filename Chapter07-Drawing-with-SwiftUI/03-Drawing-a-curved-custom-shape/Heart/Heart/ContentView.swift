//
//  ContentView.swift
//  Heart
//
//  Created by Giordano Scalzo on 02/07/2021.
//

import SwiftUI

extension CGRect {
    var quarterX: CGFloat {
        minX + size.height/4
    }
    var quarterY: CGFloat {
        minY + size.height/4
    }
    var threeQuartersX: CGFloat {
        minX + 3*size.height/4
    }
    var threeQuartersY: CGFloat {
        minY + 3*size.height/4
    }
}

struct Heart: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in

            path.move(to: CGPoint(x: rect.midX,
                                  y: rect.maxY))
            
            path.addCurve(to: CGPoint(x: rect.minX,
                                      y: rect.quarterY),
                          control1: CGPoint(x: rect.midX,
                                            y: rect.threeQuartersY),
                          control2: CGPoint(x: rect.minX,
                                            y: rect.midY))
            
            path.addArc(center: CGPoint(x: rect.quarterX,
                                        y: rect.quarterY),
                        radius: rect.size.width/4,
                        startAngle: .radians(.pi),
                        endAngle: .radians(0),
                        clockwise: false)
            
            path.addArc(center: CGPoint(x: rect.threeQuartersX,
                                        y: rect.quarterY),
                        radius: rect.size.width/4,
                        startAngle: .radians(.pi),
                        endAngle: .radians(0),
                        clockwise: false)
                        
            path.addCurve(to: CGPoint(x: rect.midX,
                                      y: rect.maxY),
                          control1: CGPoint(x: rect.maxX,
                                            y: rect.midY),
                          control2: CGPoint(x: rect.midX,
                                            y: rect.threeQuartersY))
            
            path.closeSubpath()
        }
    }
}

struct ContentView: View {
    var body: some View {
        Heart()
            .fill(.red)
            .overlay(Heart()
                .stroke(.orange, lineWidth: 10))
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
