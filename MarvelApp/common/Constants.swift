//
//  constants.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation

open class Constants: NSObject {

    public override init() {
    }

    public struct Marvel {
        public static let PublicKey = "b341288a7e0a40b3e487ef4d0b4dabf6"
        public static let PraviteKey = "090b24756dee13579474371f2336515f17e39e38"
        public static let hash = "1090b24756dee13579474371f2336515f17e39e38b341288a7e0a40b3e487ef4d0b4dabf6"
    }
    
    public struct WebService {
        public static let BaseUrl = "https://gateway.marvel.com/v1/"
    }

    public struct EndPoint {

        public static let characters = "public/characters"
        public static let comics = "comics"

    }
    
    public struct Title {
        public static let Marvel = "Marvel"
        public static let MarvelCharacters = "Marvel Characters"
        public static let Favorites = "Favorites"
        public static let AddFavorite = "Add to Favorites"
        public static let RemoveFavorite = "Remove from Favorites"
    }

}
