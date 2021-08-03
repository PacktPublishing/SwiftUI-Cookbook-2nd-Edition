//
//  ContentView.swift
//  ScrollViewReaders
//
//  Created by Edgar Nzokwe on 8/2/21.
//

import SwiftUI

struct ContentView: View {
    let imageNames = [
        ImageStore(name:"a.circle.fill",id:0),
        ImageStore(name:"b.circle.fill",id:1),
        ImageStore(name:"c.circle.fill",id:2),
        ImageStore(name:"d.circle.fill",id:3),
        ImageStore(name:"e.circle.fill",id:4),
        ImageStore(name:"f.circle.fill",id:5),
        ImageStore(name:"g.circle.fill",id:6),
        ImageStore(name:"h.circle.fill",id:7),
        ImageStore(name:"i.circle.fill",id:8),
        ImageStore(name:"j.circle.fill",id:9),
        ImageStore(name:"k.circle.fill",id:10),
        ImageStore(name:"l.circle.fill",id:11),
        ImageStore(name:"m.circle.fill",id:12),
        ImageStore(name:"n.circle.fill",id:13),
        ImageStore(name:"o.circle.fill",id:14),
        ImageStore(name:"p.circle.fill",id:15),
        ImageStore(name:"q.circle.fill",id:16),
    ]
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Go to letter Q") {
                    value.scrollTo(16)
                }
                .padding()
                .background(Color.yellow)
                ForEach(imageNames){ image in
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
struct ImageStore: Identifiable {
    var name: String
    var id: Int
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
