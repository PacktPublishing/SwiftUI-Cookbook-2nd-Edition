//
//  ContentView.swift
//  StaticTodoList
//
//  Created by Giordano Scalzo on 23/07/2021.
//

import SwiftUI

struct Todo: Identifiable {
    let id = UUID()
    let description: String
    var done: Bool
}

struct ContentView: View {
    @State
    private var todos = [
        Todo(description: "review the first chapter", done: false),
        Todo(description: "buy wine", done: false),
        Todo(description: "paint kitchen", done: false),
        Todo(description: "cut the grass", done: false),
    ]
    
    var body: some View {
        List($todos) { $todo  in
            HStack {
                Text(todo.description)
                    .strikethrough(todo.done)
                Spacer()
                Image(systemName:
                        todo.done ?
                      "checkmark.square" :
                        "square")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                todo.done.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
