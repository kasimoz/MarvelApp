//
//  CharacterDataContainer.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation
import ObjectMapper

struct CharacterDataContainer : Mappable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: Array<Character>?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        offset <- map["offset"]
        limit <- map["limit"]
        total <- map["total"]
        count <- map["count"]
        results <- map["results"]
    }
}

