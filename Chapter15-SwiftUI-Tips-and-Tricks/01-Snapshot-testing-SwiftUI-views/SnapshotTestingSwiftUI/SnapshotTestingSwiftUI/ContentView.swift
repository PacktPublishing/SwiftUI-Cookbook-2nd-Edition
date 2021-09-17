//
//  ContentView.swift
//  SnapshotTestingSwiftUI
//
//  Created by Giordano Scalzo on 16/09/2021.
//

import SwiftUI

struct ContentView: View {
    let cards: [(title: String, color: Color)] = [
        ("Visa Card", .yellow),
        ("Mastercard Credit Card", .red),
        ("Apple Credit Card", .black),
    ]
    var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<cards.count) { index in
                Text(cards[index].title)
                    .font(.system(.title))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(cards[index].color)
                    .cornerRadius(16)
            }
        }.padding(.horizontal, 16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
