//
//  ContentView.swift
//  UsingMockDataForPreviews
//
//  Created by Edgar Nzokwe on 8/24/21.
//

import SwiftUI

struct ContentView: View {
    var insects:[Insect] = []
    var body: some View {
        NavigationView {
            List {
                ForEach(insects) {insect in
                    HStack{
                        Image(insect.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Rectangle())
                            .frame(width:100, height: 80)
                            
                        VStack(alignment: .leading){
                            Text(insect.name).font(.title)
                            Text(insect.habitat)
                        }.padding(.vertical)
                    }
                }
            }.navigationBarTitle("Insects")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(insects: Self.testInsects)
    }
    static var testInsects : [Insect]{
        guard let url = Bundle.main.url(forResource: "insectData", withExtension: "json"),
        
            let data = try? Data(contentsOf: url)
            else{
                return[]
        }
        let decoder  = JSONDecoder()
        let array = try?decoder.decode([Insect].self, from: data)
        return array ??  [testInsect]
    }
}

