//
//  CharactersViewModel.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation
import Combine

class CharactersViewModel: ObservableObject {
    @Published var characters: [MarvelCharacter]? = []
    @Published var charactersIds: [Int]? = []
    @Published var showDialog: Bool = false
    @Published var error: Error? = nil
    
    var coordinator : CharactersViewCoordinator?
    
    private var dataServiceApi: DataServiceApi?
    private var coreDataManager: CoreDataManager?

    init(dataServiceApi: DataServiceApi = DataServiceApi(),
         coreDataManager: CoreDataManager = CoreDataManager()) {
        self.dataServiceApi = dataServiceApi
        self.coreDataManager = coreDataManager
    }
    
    func requestFetchCharacters(offset : Int) {
        let timeStamp = Date().currentTimeStamp
        let hash = timeStamp.getHashFromTimeStamp(privateKey: Constants.Marvel.PraviteKey, publicKey: Constants.Marvel.PublicKey)
        let charatersRequest = CharatersRequest(ts: timeStamp, apikey: Constants.Marvel.PublicKey, hash: hash, limit: 30, offset: offset)
        self.showDialog = offset == 0
        self.dataServiceApi?.requestFetchCharacters(parameters: charatersRequest.dictionary, completion:{ (characters, error) in
            self.showDialog = false
            if let error = error {
                self.error = error
                return
            }
            self.characters = characters?.data?.toMarvelCharacterList()
        })
    }
    
    
    func reloadView(){
        self.charactersIds = self.coreDataManager?.fetchCharacters().map({
            $0.value(forKey: "id") as! Int
        })
    }
    
    func addToFavorites(marvelCharacter : MarvelCharacter){
        self.coreDataManager?.saveCharacter(charater: marvelCharacter)
        self.reloadView()
    }
    
    func removeFromFavorites(id : Int){
        self.coreDataManager?.removeCharacter(id: id)
        self.reloadView()
    }
    
    func didSelectedCharacter(character : MarvelCharacter){
        coordinator?.startDetailView(character: character)
    }
    
    func didTappedRightButton(){
        coordinator?.startFavoriteView()
    }
    

}
