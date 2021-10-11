//
//  CharacterDataWrapperCC.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import Foundation
import ObjectMapper

struct CharacterDataWrapperCC : Mappable {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var etag: String?
    var data: CharacterDataContainerCC?

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
