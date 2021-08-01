//
//  ContentView.swift
//  ListRowEdit
//
//  Created by Edgar Nzokwe on 7/29/21.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["USA", "Canada", "England","Cameroon", "South Africa", "Mexico" , "Japan", "South Korea"]
    var body: some View {
        NavigationView{
            List {
                ForEach(countries, id: \.self) { country in
                    Text(country)
                }
                .onDelete(perform: self.deleteItem)
            }
            .navigationBarTitle("Countries", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
    }
    private func deleteItem(at indexSet: IndexSet){
        self.countries.remove(atOffsets: indexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
