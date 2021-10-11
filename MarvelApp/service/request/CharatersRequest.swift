//
//  CharatersRequest.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation

struct CharatersRequest: Codable {
    let ts: String
    let apikey: String
    let hash: String
    let limit: Int
    let offset : Int
}
