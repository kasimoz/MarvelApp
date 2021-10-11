//
//  Comic.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import Foundation
import ObjectMapper

struct Comic : Mappable {
    var id : Int?
    var digitalId : Int?
    var title : String?
    var issueNumber : Double?
    var variantDescription : String?
    var description : String?
    var modified : String?
    var isbn : String?
    var upc : String?
    var diamondCode : String?
    var ean : String?
    var issn : String?
    var format : String?
    var pageCount : Int?
    var textObjects : Array<TextObject>?
    var resourceURI : String?
    var urls : Array<Url>?
    var series : Summary?
    var variants : Array<Summary>?
    var collections : Array<Summary>?
    var collectedIssues : Array<Summary>?
    var dates : Array<ComicDate>?
    var prices : Array<ComicPrice>?
    var thumbnail : Image?
    var images : Array<Image>?
    var creators : CreatorList?
    var characters : CharacterList?
    var stories : StoryList?
    var events : EventList?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        digitalId <- map["digitalId"]
        title <- map["title"]
        issueNumber <- map["issueNumber"]
        variantDescription <- map["variantDescription"]
        description <- map["description"]
        modified <- map["modified"]
        isbn <- map["isbn"]
        upc <- map["upc"]
        diamondCode <- map["diamondCode"]
        ean <- map["ean"]
        issn <- map["issn"]
        format <- map["format"]
        pageCount <- map["pageCount"]
        textObjects <- map["textObjects"]
        resourceURI <- map["resourceURI"]
        urls <- map["urls"]
        series <- map["series"]
        variants <- map["variants"]
        collections <- map["collections"]
        collectedIssues <- map["collectedIssues"]
        dates <- map["dates"]
        prices <- map["prices"]
        thumbnail <- map["thumbnail"]
        images <- map["images"]
        creators <- map["creators"]
        characters <- map["characters"]
        stories <- map["stories"]
        events <- map["events"]
    }

}
