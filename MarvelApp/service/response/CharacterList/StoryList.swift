//
//  StoryList.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation
import ObjectMapper

struct StoryList : Mappable {
    var available : Int?
    var returned : Int?
    var collectionURI : String?
    var items : Array<Summary>?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        available <- map["available"]
        returned <- map["returned"]
        collectionURI <- map["collectionURI"]
        items <- map["items"]
    }

}
