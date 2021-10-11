//
//  ComicDate.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import Foundation
import ObjectMapper

struct ComicDate : Mappable {
    var type : String?
    var date : String?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        type <- map["type"]
        date <- map["date"]
    }

}
