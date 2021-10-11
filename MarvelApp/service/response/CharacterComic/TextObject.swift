//
//  TextObject.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import Foundation
import ObjectMapper

struct TextObject : Mappable {
    var type : String?
    var language : String?
    var text : String?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        type <- map["type"]
        language <- map["language"]
        text <- map["text"]
    }

}
