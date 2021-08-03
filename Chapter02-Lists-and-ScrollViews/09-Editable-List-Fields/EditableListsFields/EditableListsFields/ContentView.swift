//
//  ContentView.swift
//  EditableListsFields
//
//  Created by Edgar Nzokwe on 8/1/21.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    init(_ someTitle:String){
        title = someTitle
    }
    
}

struct ContentView: View {
    @State var todos = [
        TodoItem("Eat"),
        TodoItem("Sleep"),
        TodoItem("Code")
    ]
    
    var body: some View {
        List($todos) { $todo in
            TextField("Number", text: $todo.title)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
