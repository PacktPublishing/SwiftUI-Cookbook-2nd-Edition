//
//  ContentView.swift
//  FirebaseNotes
//
//  Created by Giordano Scalzo on 26/08/2021.
//

import SwiftUI

struct Note: Identifiable, Codable {
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
    
    private var repository: NotesRepository = NotesRepository()
    
    @State
    var isNewNotePresented = false
    @State
    var notes: [Note] = []
    
    var body: some View {
        
        NavigationView {
            List(notes) { note in
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
            .navigationBarTitle("FireNotes", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button {
                isNewNotePresented.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.headline)
            })
            .sheet(isPresented: $isNewNotePresented) {
                NewNote(isNewNotePresented: $isNewNotePresented,
                        notes: $notes,
                        repository: repository)
            }
            .task {
                notes = await repository.fetchNotes()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
