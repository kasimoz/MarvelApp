//
//  Character.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation

struct MarvelCharacter {
    let id: Int?
    let name: String?
    var description : String?
    var thumbnail: Image?
    var comics: ComicList?
    
    init(id: Int?, name:String?, description : String?, thumbnail: Image?, comics: ComicList?) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
        self.comics = comics
    }
}
