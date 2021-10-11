//
//  CharacterDetailViewModel.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import Foundation
import Combine

class CharacterDetailViewModel: ObservableObject {
    @Published var character: MarvelCharacter?
    @Published var comics: [CharacterComic]? = []
    @Published var error: Error? = nil
    
    var coordinator : CharacterDetailViewCoordinator?
    
    private var dataServiceApi: DataServiceApi?

    init(dataServiceApi: DataServiceApi = DataServiceApi()) {
        self.dataServiceApi = dataServiceApi
    }
    
    func requestFetchComics(characterId : Int) {
        let timeStamp = Date().currentTimeStamp
        let hash = timeStamp.getHashFromTimeStamp(privateKey: Constants.Marvel.PraviteKey, publicKey: Constants.Marvel.PublicKey)
        let comicRequest = ComicRequest(ts: timeStamp, apikey: Constants.Marvel.PublicKey, hash: hash, dateRange: Date().toString(), limit: 10, orderBy: "-focDate")
        self.dataServiceApi?.requestFetchComics(characterId: "/\(characterId)/", parameters: comicRequest.dictionary, completion:{ (comics, error) in
            if let error = error {
                self.error = error
                return
            }
            self.comics = comics?.data?.toMarvelComicList()
        })
    }
    
    func viewDidDisappear(){
        coordinator?.didFinishCharacterDetail()
    }
    
    
    
    deinit {
        print("deinit CharacterDetailViewModel")
    }
}
