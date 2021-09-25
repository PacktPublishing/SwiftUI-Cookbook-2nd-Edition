//
//  Insect.swift
//  Cross-Platform
//
//  Created by Edgar Nzokwe on 9/18/21.
//

import Foundation

struct Insect : Decodable, Identifiable, Hashable{
    var id: Int
    var imageName:String
    var name:String
    var habitat:String
    var description:String
}

let testInsect = Insect(id: 1, imageName: "grasshopper", name: "grass", habitat: "pond", description: "long description here")
