//
//  ShowNote.swift
//  ShowNote
//
//  Created by Giordano Scalzo on 26/08/2021.
//

import Foundation
import SwiftUI

struct ShowNote: View {
    let note: Note
    var body: some View {
        VStack(spacing: 12) {
            Text(note.title)
                .font(.headline)
                .fontWeight(.bold)
            ReadonlyTextEditor(text: note.body)
                .border(.gray)
        }
        .padding(32)
    }
}

struct ReadonlyTextEditor: UIViewRepresentable {
    var text: String
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = false
        view.isUserInteractionEnabled = true
        return view
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
