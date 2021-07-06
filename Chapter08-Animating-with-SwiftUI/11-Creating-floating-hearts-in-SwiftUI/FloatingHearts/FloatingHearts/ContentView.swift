//
//  ContentView.swift
//  FloatingHearts
//
//  Created by Giordano Scalzo on 06/07/2021.
//

import SwiftUI
import SwiftCubicSpline

struct MoveShakeScale: GeometryEffect {
    private(set) var pct: CGFloat
    private let xPosition = UIScreen.main.bounds.width/4 +
        CGFloat.random(in: -20..<20)
    
    private let scaleSpline = CubicSpline(points: [
        Point(x: 0, y: 0.0),
        Point(x: 0.3, y: 3.5),
        Point(x: 0.4, y: 3.1),
        Point(x: 1.0, y: 2.1),
    ])
    
    private let xSpline = CubicSpline(points: [
        Point(x: 0.0,  y: 0.0),
        Point(x: 0.15, y: 20.0),
        Point(x: 0.3,  y: 12),
        Point(x: 0.5,  y: 0),
        Point(x: 1.0,  y: 8),
    ])
    
    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let scale = scaleSpline[x: Double(pct)]
        let xOffset = xSpline[x: Double(pct)]
        
        let yOffset = UIScreen.main.bounds.height/2 -
                      pct * UIScreen.main.bounds.height/4*3
        
        let transTrasf = CGAffineTransform(
            translationX: xPosition + CGFloat(xOffset),
            y: yOffset)
        let scaleTrasf = CGAffineTransform(scaleX: CGFloat(scale),
                                                y: CGFloat(scale))
        return ProjectionTransform(scaleTrasf.concatenating(transTrasf))
    }
}

extension Color {
    init(r: Double, g: Double, b: Double) {
        self.init(red: r/255, green: g/255, blue: b/255)
    }
    static func random() -> Color {
        Color(r: .random(in: 100...144),
              g: .random(in: 10...200),
              b: .random(in: 200...244))
    }
}

struct Heart: View, Identifiable {
    let id = UUID()
    
    @State
    private var opacity = 1.0
    @State
    private var scale: CGFloat = 1.0
    @State
    private var toAnimate = false
    
    var body: some View {
        Image(systemName: "heart.fill")
            .foregroundColor(.random())
            .opacity(opacity)
            .modifier(MoveShakeScale(pct: toAnimate ? 1 : 0))
            .animation(Animation.easeIn(duration: 5.0), value: toAnimate)
            .task {
                toAnimate.toggle()
                withAnimation(.easeIn(duration: 5)) {
                    opacity = 0
                }
        }
    }
}

extension Heart: Equatable {
    static func == (lhs: Heart, rhs: Heart) -> Bool {
        lhs.id == rhs.id
    }
}

extension Array where Element: Equatable {
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}

class Hearts: ObservableObject {
    @Published
    private(set) var all: [Heart] = []
    
    func new() {
        let heart = Heart()
        all.append(heart)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            self.all.remove(object: heart)
        }
    }
}

struct HeartsView: View {
    @ObservedObject
    var hearts: Hearts
    
    var body: some View {
        ForEach(hearts.all) { $0 }
    }
}

struct ContentView: View {
    var hearts = Hearts()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button {
                    hearts.new()
                } label: {
                    Image(systemName: "heart")
                        .font(.title)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                Spacer()
            }.padding(.horizontal, 30)
        }
        .overlay(HeartsView(hearts: hearts))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
