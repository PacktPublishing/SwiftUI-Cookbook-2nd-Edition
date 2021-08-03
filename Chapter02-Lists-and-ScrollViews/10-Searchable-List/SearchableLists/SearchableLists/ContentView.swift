//
//  ContentView.swift
//  SearchableLists
//
//  Created by Edgar Nzokwe on 8/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText=""
    let messages = [
        "dad can you lend me money",
        "nada. Does money grows on trees",
        "What is money made out of?",
        "Paper?",
        "Where does paper come from",
        "huh.....",
        
        ]
    var body: some View {
        NavigationView {
            List{
                ForEach(searchResults, id: \.self){ msg in
                    Text(msg)
                }
            }
            .searchable(text: $searchText){
                ForEach(searchResults, id: \.self) { result in
                                   Text("Are you looking for \(result)?").searchCompletion(result)
                               }
            }
            .navigationBarTitle("Order number")
        }
    }
    var searchResults: [String] {
        if searchText.isEmpty {
            return messages
        }else{
            return messages.filter{ $0.lowercased().contains(searchText.lowercased())}
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
