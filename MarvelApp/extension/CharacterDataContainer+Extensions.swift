//
//  CharacterDataContainer+Extensions.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation


extension CharacterDataContainer {
    
    func toMarvelCharacterList() -> [MarvelCharacter]? {
        return self.results?.compactMap {
            return MarvelCharacter(id:$0.id, name: $0.name, description: $0.description, thumbnail: $0.thumbnail, comics: $0.comics)
        }
    }
}

extension CharacterDataContainerCC {
    
    func toMarvelComicList() -> [CharacterComic]? {
        return self.results?.compactMap {
            return CharacterComic(id: $0.id, issueNumber: $0.issueNumber, title: $0.title, description: $0.description, thumbnail: $0.thumbnail)
        }
    }
}

