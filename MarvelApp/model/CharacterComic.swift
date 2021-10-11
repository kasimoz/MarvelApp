//
//  CharacterComic.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import Foundation

struct CharacterComic {
    let id: Int?
    let issueNumber : Double?
    var title : String?
    var description : String?
    var thumbnail: Image?
    
    init(id:Int?, issueNumber : Double?,title : String?, description : String?, thumbnail: Image?) {
        self.id = id
        self.issueNumber = issueNumber
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
    }
}
