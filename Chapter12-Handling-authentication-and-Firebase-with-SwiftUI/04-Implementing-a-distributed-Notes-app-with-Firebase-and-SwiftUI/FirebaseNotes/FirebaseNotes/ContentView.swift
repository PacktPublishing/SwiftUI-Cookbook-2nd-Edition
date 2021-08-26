//
//  ContentView.swift
//  FirebaseNotes
//
//  Created by Giordano Scalzo on 26/08/2021.
//

import SwiftUI

struct Note: Identifiable {
    let id: String
    let title: String
    let date: Date
    let body: String
}

struct ContentView: View {
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    @ObservedObject
    var repository: NotesRepository = NotesRepository()

    @State
    var isNewNotePresented = false

    var body: some View {

        NavigationView {
            List {
                ForEach(repository.notes) { note in
                    NavigationLink(destination: ShowNote(note: note)) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("\(note.date, formatter: Self.taskDateFormat)")
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete{ indexSet in
                    if let index = indexSet.first {
                        repository.remove(at: index)
                    }
                }
            }
            .navigationBarTitle("FireNotes", displayMode: .inline)
            .navigationBarItems(trailing:
                Button {
                    isNewNotePresented.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.headline)
                }
            ).sheet(isPresented: $isNewNotePresented) {
                NewNote(isNewNotePresented: $isNewNotePresented,
                        repository: repository)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
