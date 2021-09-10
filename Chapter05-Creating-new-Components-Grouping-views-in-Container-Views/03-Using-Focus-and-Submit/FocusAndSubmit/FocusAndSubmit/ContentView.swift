//
//  ContentView.swift
//  FocusAndSubmit
//
//  Created by Edgar Nzokwe on 9/6/21.
//

import SwiftUI

struct ContentView: View {
    enum AddressField{
        case streetName
        case city
        case state
        case zipCode
    }
    @State private var streetName = ""
    @State private var city = ""
    @State private var state = ""
    @State private var zipCode = ""
    
    @FocusState private var currentFocus: AddressField?
    var body: some View {
        VStack{
            TextField("Address", text: $streetName)
                .focused($currentFocus, equals: .streetName)
                .submitLabel(.next)
            TextField("City", text: $city)
                .focused($currentFocus, equals: .city)
                .submitLabel(.next)
            TextField("State", text: $state)
                .focused($currentFocus, equals: .state)
                .submitLabel(.next)
            TextField("Zip code", text: $zipCode)
                .focused($currentFocus, equals: .zipCode)
                .submitLabel(.done)
        }.onSubmit {
            switch currentFocus {
            case .streetName:
                currentFocus = .city
            case .city:
                currentFocus = .state
            case .state:
                currentFocus = .zipCode
            default:
                print("Thanks for providing your address")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
