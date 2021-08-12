//
//  ContentView.swift
//  LazyStacks
//
//  Created by Edgar Nzokwe on 8/2/21.
//

import SwiftUI

struct ListRow: View {
    let id: Int
    let type: String
    init(id: Int, type: String){
        print("Loading \(type) item \(id)")
        self.id = id
        self.type = type
    }
    var body: some View {
        Text("\(type) \(id)").padding()
    }
}

struct ContentView: View {
    var body: some View {
        VStack{
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(1...10000, id:\.self){ item in
                        ListRow(id: item, type: "Horizontal")
                    }
                }
            }.frame(height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ScrollView {
                LazyVStack {
                    ForEach(1...10000, id:\.self){ item in
                        ListRow(id: item, type: "Vertical")
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
