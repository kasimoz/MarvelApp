//
//  ComicPrice.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import Foundation
import ObjectMapper

struct ComicPrice : Mappable {
    var type : String?
    var price : Float?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        type <- map["type"]
        price <- map["price"]
    }

}
