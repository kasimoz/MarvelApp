//
//  FavoriteCharactersViewModel.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 10.10.2021.
//

import Foundation
import Combine

class FavoriteCharactersViewModel: ObservableObject {
    
    @Published var characters: [MarvelCharacter]? = []
        
    var coordinator : FavoriteCharactersViewCoordinator?
    
    private var coreDataManager: CoreDataManager?

    init(coreDataManager: CoreDataManager = CoreDataManager()) {
        self.coreDataManager = coreDataManager
    }
    
    func fetchCharacters(){
        let results = self.coreDataManager?.fetchCharacters()
        self.characters = results?.compactMap({ item in
            let id = item.value(forKey: "id") as! Int
            let name = item.value(forKey: "name") as! String
            let desc = item.value(forKey: "desc") as! String
            let path = item.value(forKey: "path") as! String
            let ext = item.value(forKey: "ext") as! String
            
            return MarvelCharacter.init(id: id, name: name, description: desc, thumbnail: Image.init(path: path, extension_: ext), comics: nil)
        })
    }
    
    func removeFromFavorites(id : Int){
        self.coreDataManager?.removeCharacter(id: id)
    }
    
    func viewDidDisappear(){
        coordinator?.didFinishFavoriteCharacters()
    }
    
    deinit {
        print("deinit FavoriteCharactersViewModel")
    }
}
