//
//  DataServiceApi.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class DataServiceApi  {
    
    func requestFetchCharacters(parameters: Parameters?, completion: @escaping (CharacterDataWrapper?, Error?) -> ()) {
        DataService.shared.request(endPoint: Constants.EndPoint.characters, method: .get, parameters: parameters,type: CharacterDataWrapper.self) { (response, error) in
            completion(response, error)
        }
    }
    
    func requestFetchComics(characterId: String, parameters: Parameters?, completion: @escaping (CharacterDataWrapperCC?, Error?) -> ()) {
        DataService.shared.request(endPoint: Constants.EndPoint.characters.appending(characterId).appending(Constants.EndPoint.comics), method: .get, parameters: parameters,type: CharacterDataWrapperCC.self) { (response, error) in
            completion(response, error)
        }
    }
    
}
