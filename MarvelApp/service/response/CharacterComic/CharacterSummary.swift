//
//  CharacterSummary.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import Foundation
import ObjectMapper

struct CharacterSummary : Mappable {
    var resourceURI : String?
    var name : String?
    var role : String?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        resourceURI <- map["resourceURI"]
        name <- map["name"]
        role <- map["role"]
    }

}
