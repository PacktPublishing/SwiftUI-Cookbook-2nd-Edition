//
//  InsectData.swift
//  Cross-Platform
//
//  Created by Edgar Nzokwe on 9/18/21.
//

import Foundation
import Combine

final class InsectData: ObservableObject {
    @Published var insects = testInsects
    
}
var testInsects : [Insect]{
    guard let url = Bundle.main.url(forResource: "insectData", withExtension: "json"),
    
        let data = try? Data(contentsOf: url)
        else{
            return[]
    }
    let decoder  = JSONDecoder()
    let array = try?decoder.decode([Insect].self, from: data)
    return array ??  [testInsect]
}
