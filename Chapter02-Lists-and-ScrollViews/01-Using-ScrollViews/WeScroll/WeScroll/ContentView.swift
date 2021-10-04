//
//  ContentView.swift
//  WeScroll
//
//  Created by Edgar Nzokwe on 7/25/21.
//

import SwiftUI

struct ContentView: View {
    let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]
    var body: some View {
        VStack{
            ScrollView {
                ForEach(self.letters, id: \.self){ letter in
                        Image(systemName: letter)
                            .font(.largeTitle)
                            .foregroundColor(Color.yellow)
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                            .symbolVariant(.circle.fill)
                    }
            }
            .frame(width:50, height:200)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(self.letters, id: \.self){ letter in
                        Image(systemName: letter)
                            .font(.largeTitle)
                            .foregroundColor(Color.yellow)
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                            .symbolVariant(.circle.fill)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
