//
//  ContentView.swift
//  RestaurantMenu
//
//  Created by Giordano Scalzo on 16/09/2021.
//

import SwiftUI


extension Font {
    static func oleoBold(size: CGFloat) -> Font {
        .custom("OleoScriptSwashCaps-Bold", size: size)
    }
    static func oleoRegular(size: CGFloat) -> Font {
        .custom("OleoScriptSwashCaps-Regular", size: size)
    }
    static func sacramento(size: CGFloat) -> Font {
        .custom("Sacramento-Regular", size: size)
    }
}

struct ItemView: View {
    let name: String
    let price: String
    
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(price)
        }
        .font(.sacramento(size: 40))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
        Text("Casa Mia")
            .font(.oleoBold(size: 80))
            Text("Restaurant")
                .font(.oleoRegular(size: 60))
            ItemView(name: "Pizza Margherita", price: "$10")
            ItemView(name: "Fettuccine Alfredo", price: "$14")
            ItemView(name: "Pollo Arrosto", price: "$19")
            ItemView(name: "Insalata Caprese", price: "$12")
            ItemView(name: "Gelato", price: "$9")
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
