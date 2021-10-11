//
//  Character.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation
import ObjectMapper

struct Character : Mappable {
    var id : Int?
    var name : String?
    var description : String?
    var modified: String?
    var resourceURI: String?
    var urls: Array<Url>?
    var thumbnail: Image?
    var comics: ComicList?
    var stories: StoryList?
    var events: EventList?
    var series: SeriesList?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        modified <- map["modified"]
        resourceURI <- map["resourceURI"]
        urls <- map["urls"]
        thumbnail <- map["thumbnail"]
        comics <- map["comics"]
        stories <- map["stories"]
        events <- map["events"]
        series <- map["series"]
    }

}


