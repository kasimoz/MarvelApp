//
//  Url.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation
import ObjectMapper

struct Url : Mappable {
    var type : String?
    var url : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        type <- map["type"]
        url <- map["url"]
    }

}
