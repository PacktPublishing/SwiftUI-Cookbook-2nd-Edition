//
//  ContentView.swift
//  ProgressRings
//
//  Created by Giordano Scalzo on 02/07/2021.
//

import SwiftUI

struct ProgressRing: Shape {
    private let startAngle = Angle.radians(1.5 * .pi)
    
    @Binding
    var progress: Double
    
    func path(in rect: CGRect) -> Path {
        Path() { path in
            path.addArc(
                center: CGPoint(x: rect.midX,
                                y: rect.midY),
                radius: rect.width / 2,
                startAngle: startAngle,
                endAngle: startAngle +
                Angle(
                    radians: 2 * .pi * progress),
                clockwise: false
            )
        }
    }
}

struct ProgressRingsView: View {
    private let ringPadding = 5.0
    private let ringWidth = 40.0
    private var ringStrokeStyle: StrokeStyle {
        StrokeStyle(lineWidth: ringWidth,
                    lineCap: .round,
                    lineJoin: .round)
    }
    
    @Binding
    var progressExternal: Double
    @Binding
    var progressCentral: Double
    @Binding
    var progressInternal: Double
    
    var body: some View {
        ZStack {
            ProgressRing(progress: $progressInternal)
                .stroke(.blue,
                        style: ringStrokeStyle)
                .padding(2*(ringWidth + ringPadding))
            ProgressRing(progress: $progressCentral)
                .stroke(.red,
                        style: ringStrokeStyle)
                .padding(ringWidth + ringPadding)
            ProgressRing(progress: $progressExternal)
                .stroke(.green,
                        style: ringStrokeStyle)
            
        }
        .padding(ringWidth)
    }
}

struct ContentView: View {
    @State
    private var progressExternal = 0.3
    @State
    private var progressCentral = 0.7
    @State
    private var progressInternal = 0.5
    
    var body: some View {
        ZStack {
            ProgressRingsView(progressExternal: $progressExternal,
                              progressCentral: $progressCentral,
                              progressInternal: $progressInternal)
                .aspectRatio(contentMode: .fit)
            VStack(spacing: 10) {
                Spacer()
                Slider(value: $progressInternal,
                       in: 0...1, step: 0.01)
                Slider(value: $progressCentral,
                       in: 0...1, step: 0.01)
                Slider(value: $progressExternal,
                       in: 0...1, step: 0.01)
            }
            .padding(30)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
