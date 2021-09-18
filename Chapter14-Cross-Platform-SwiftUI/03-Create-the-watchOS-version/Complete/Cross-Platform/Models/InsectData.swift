//
//  InsectData.swift
//  Cross-Platform
//
//  Created by Edgar Nzokwe on 6/17/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
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
