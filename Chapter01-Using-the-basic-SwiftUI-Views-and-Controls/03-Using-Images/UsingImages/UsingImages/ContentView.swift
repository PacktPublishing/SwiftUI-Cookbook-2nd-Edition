//
//  ContentView.swift
//  UsingImages
//
//  Created by Edgar Nzokwe on 7/18/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image("dogs1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            Image("dog-and-nature")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:300, height:200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 6))
            .shadow(radius: 10)
            Image(uiImage: getImageFromUIImage(image: "dog2"))
            .resizable()
            .frame(width: 200, height: 200)
            .aspectRatio(contentMode: .fit)
                
        }
    }
}
func getImageFromUIImage(image:String) -> UIImage {
    guard let img = UIImage(named: image) else {
        fatalError("Unable to load image")
    }
    return img
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
