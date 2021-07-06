//
//  ContentView.swift
//  StretchableHeader
//
//  Created by Giordano Scalzo on 06/07/2021.
//

import SwiftUI

extension GeometryProxy {
    private var offset: CGFloat {
        frame(in: .global).minY
    }

    var height: CGFloat {
        size.height + (offset > 0 ? offset : 0)
    }
    
    var verticalOffset: CGFloat {
        offset > 0 ? -offset : 0
    }
}

struct StretchableHeader: View {
    let imageName: String
    
    var body: some View {
        GeometryReader { geometry in
            Image(self.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width,
                       height: geometry.height)
                .offset(y: geometry.verticalOffset)
        }
        .frame(height: 350)
    }
}

struct Row: View {
    var body: some View {
        HStack {
            Image("avatar")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Spacer()
            VStack(alignment: .trailing) {
                Text("Billie Eilish")
                    .fontWeight(.heavy)
                Text("Happier Than Ever")
            }
        }
        .padding(.horizontal, 15)
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                StretchableHeader(imageName: "header")
                ForEach(0..<6) { _ in
                    Row()
                    Divider()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
