//
//  CharacterDataWrapper.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation
import ObjectMapper

struct CharacterDataWrapper : Mappable {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var etag: String?
    var data: CharacterDataContainer?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        status <- map["status"]
        copyright <- map["copyright"]
        attributionText <- map["attributionText"]
        attributionHTML <- map["attributionHTML"]
        etag <- map["etag"]
        data <- map["data"]
    }
}


