//
//  Insect.swift
//  UsingMockDataForPreviews
//
//  Created by Edgar Nzokwe on 8/24/21.
//

import Foundation


struct Insect : Decodable, Identifiable{
    var id: Int
    var imageName:String
    var name:String
    var habitat:String
    var description:String
}

let testInsect = Insect(id: 1, imageName: "grasshopper", name: "grass", habitat: "rocks", description: "none")
