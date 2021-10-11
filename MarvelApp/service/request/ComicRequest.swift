//
//  ComicRequest.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import Foundation

struct ComicRequest: Codable {
    let ts: String
    let apikey: String
    let hash: String
    let dateRange: String
    let limit: Int
    let orderBy : String
}
