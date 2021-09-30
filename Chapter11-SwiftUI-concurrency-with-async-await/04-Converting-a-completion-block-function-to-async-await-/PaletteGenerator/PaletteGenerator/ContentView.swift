//
//  ContentView.swift
//  PaletteGenerator
//
//  Created by Giordano Scalzo on 30/09/2021.
//

import SwiftUI
import Lorikeet

extension Color: Identifiable {
    public var id: String {
        self.description
    }
}

extension Color {
    var lkt: Lorikeet {
        UIColor(self).lkt
    }
}

extension Lorikeet {
    func generateColorScheme(numberOfColors: Int,
                             withRange range: HSVRange? = nil,
                             using algorithm: Algorithm = .cie2000) async -> [Color] {
        await withCheckedContinuation { continuation in
            generateColorScheme(numberOfColors: numberOfColors,
                                withRange: range,
                                using: algorithm) { colors in
                continuation.resume(returning: colors.map(Color.init))
            }
        }
    }
}

struct ContentView: View {
    @State var colors: [Color] = []
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing:0) {
                ForEach(colors){  color in
                    Rectangle()
                        .foregroundColor(color)
                        .frame(height: 100)
                }
            }
        }
        .edgesIgnoringSafeArea(.vertical)
        .task {
            colors = await Color.blue.lkt.generateColorScheme(numberOfColors: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
