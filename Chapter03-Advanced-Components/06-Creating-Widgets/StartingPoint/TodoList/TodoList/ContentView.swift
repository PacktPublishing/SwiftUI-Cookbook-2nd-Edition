//
//  ContentView.swift
//  TodoList
//
//  Created by Edgar Nzokwe on 8/15/21.
//

import SwiftUI

struct ContentView: View {
    @State var t = tasks
    var body: some View {
        TaskListView(tasks: $t)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
