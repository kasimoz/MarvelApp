//
//  Image.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation
import ObjectMapper

struct Image : Mappable {
    var path : String?
    var extension_ : String?

    init?(map: Map) {

    }
    
    init?(path : String, extension_ : String){
        self.path = path
        self.extension_ = extension_
    }

    mutating func mapping(map: Map) {
        path <- map["path"]
        extension_ <- map["extension"]
    }

}
