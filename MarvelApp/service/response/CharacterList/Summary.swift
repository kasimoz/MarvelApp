//
//  Summary.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation
import ObjectMapper

struct Summary : Mappable {
    var resourceURI : String?
    var name : String?
    var type : String?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        resourceURI <- map["resourceURI"]
        name <- map["name"]
        type <- map["type"]
    }

}
