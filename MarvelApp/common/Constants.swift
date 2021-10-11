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
        public static let PublicKey = "Your_Public_Key"
        public static let PraviteKey = "Your_Private_key"
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
