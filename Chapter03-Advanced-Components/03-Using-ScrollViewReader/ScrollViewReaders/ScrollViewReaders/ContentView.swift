//
//  ContentView.swift
//  ScrollViewReaders
//
//  Created by Edgar Nzokwe on 8/2/21.
//

import SwiftUI
struct characterInfo: Identifiable {
    var name: String
    var id: Int
}
struct ContentView: View {
    let charArray = [
        characterInfo(name:"a.circle.fill",id:0),
        characterInfo(name:"b.circle.fill",id:1),
        characterInfo(name:"c.circle.fill",id:2),
        characterInfo(name:"d.circle.fill",id:3),
        characterInfo(name:"e.circle.fill",id:4),
        characterInfo(name:"f.circle.fill",id:5),
        characterInfo(name:"g.circle.fill",id:6),
        characterInfo(name:"h.circle.fill",id:7),
        characterInfo(name:"i.circle.fill",id:8),
        characterInfo(name:"j.circle.fill",id:9),
        characterInfo(name:"k.circle.fill",id:10),
        characterInfo(name:"l.circle.fill",id:11),
        characterInfo(name:"m.circle.fill",id:12),
        characterInfo(name:"n.circle.fill",id:13),
        characterInfo(name:"o.circle.fill",id:14),
        characterInfo(name:"p.circle.fill",id:15),
        characterInfo(name:"q.circle.fill",id:16),
    ]
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Go to letter Q") {
                    value.scrollTo(16)
                }
                .padding()
                .background(Color.yellow)
                ForEach(charArray){ image in
                    Image(systemName: image.name)
                        .id(image.id)
                        .font(.largeTitle)
                        .foregroundColor(Color.yellow)
                        .frame(width: 90, height: 90)
                        .background(Color.blue)
                        .padding()
                }
                Button("Go to G") {
                    value.scrollTo(6, anchor: .bottom)
                }
                .padding()
                .background(Color.yellow)
            }
                
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
