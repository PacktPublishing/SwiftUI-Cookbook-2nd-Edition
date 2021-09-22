//
//  ContentView.swift
//  MarkdownEditor
//
//  Created by Giordano Scalzo on 18/09/2021.
//

import SwiftUI

struct TabButton: View {
    let label: String
    let onTap: ()->Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Text(.init(label))
                .frame(width:30)
        }
        .buttonStyle(.bordered)
    }
}

struct EditorView: View {
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TabButton(label: "**B**") {
                    text+="**"
                }
                TabButton(label: "*I*") {
                    text+="*"
                }
                TabButton(label: "***B***") {
                    text+="***"
                }
                TabButton(label: "~~S~~") {
                    text+="~~"
                }
            }
            TextEditor(text: $text)
        }
    }
}

struct PreviewView: View {
    var text: String
    var body: some View {
        VStack {
            Text(.init(text))
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }
}


struct ContentView: View {
    @State private var tabShown = 0
    @State private var text = ""
    
    var body: some View {
        VStack {
            Picker("", selection: $tabShown) {
                Text("Editor").tag(0)
                Text("Preview").tag(1)
            }
            .pickerStyle(.segmented)
            if tabShown == 0 {
                EditorView(text: $text)
            } else {
                PreviewView(text: text)
            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
