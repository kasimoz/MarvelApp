//
//  FavoriteCharactersViewCoordinator.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 10.10.2021.
//

import UIKit

final class FavoriteCharactersViewCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    
    var parentCoordinator : CharactersViewCoordinator?

    let navigationController : UINavigationController
        
    init(navigationController : UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let favoriteCharactersViewController : FavoriteCharactersViewController = .instantiate()
        let favoriteCharactersViewModel = FavoriteCharactersViewModel()
        favoriteCharactersViewModel.coordinator = self
        favoriteCharactersViewController.viewModel = favoriteCharactersViewModel
        navigationController.present(favoriteCharactersViewController, animated: true, completion: nil)
    }
    
    func didFinishFavoriteCharacters(){
        parentCoordinator?.onChangeEvent()
        parentCoordinator?.childDidFinish()
    }
    
    
    deinit {
        print("deinit FavoriteCharactersViewCoordinator")
    }
    
}
