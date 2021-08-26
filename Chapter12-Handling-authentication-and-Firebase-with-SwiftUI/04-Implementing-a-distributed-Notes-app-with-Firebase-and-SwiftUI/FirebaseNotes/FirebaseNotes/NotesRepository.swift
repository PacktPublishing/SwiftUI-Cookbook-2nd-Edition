//
//  NotesRepository.swift
//  NotesRepository
//
//  Created by Giordano Scalzo on 26/08/2021.
//

import Foundation
import Firebase

class NotesRepository: ObservableObject {
    @Published
    var notes: [Note] = []

    private let db = Firestore.firestore()

    init() {
        loadAll()
    }

    func newNote(title: String, date: Date, body: String) {
        db.collection("notes").addDocument(data: [
            "title": title,
            "date": date,
            "body": body,
        ])

        loadAll()
    }

    func remove(at index: Int) {
        let noteToDelete = notes[index]
        db.collection("notes").document(noteToDelete.id).delete()
        loadAll()
    }

    private func loadAll() {
        db.collection("notes").getDocuments { (snapshot, error) in
            if let error = error {
                print(error) // manage errors
                return
            }
            guard let documents = snapshot?.documents else {
                return
            }

            self.notes = documents.compactMap { document in
                let data = document.data()
                guard let title = data["title"] as? String,
                    let timestamp = data["date"] as? Timestamp,
                    let body = data["body"] as? String else {
                        return nil
                }
                return Note(id: document.documentID,
                            title: title,
                            date: timestamp.dateValue(),
                            body: body)
            }
        }
    }
}
