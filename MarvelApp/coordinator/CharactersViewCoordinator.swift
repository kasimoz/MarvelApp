//
//  CharactersViewCordinator.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import UIKit

final class CharactersViewCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    
    var onChangeEvent = {}
    
    let navigationController : UINavigationController
    
    init(navigationController : UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let charactersViewController : CharactersViewController = .instantiate()
        let charactersViewModel = CharactersViewModel()
        charactersViewModel.coordinator = self
        onChangeEvent = charactersViewModel.reloadView
        charactersViewController.charactersViewModel = charactersViewModel
        navigationController.setViewControllers([charactersViewController], animated: false)
    }
    
    func startDetailView(character : MarvelCharacter) {
        let characterDetailViewCordinator = CharacterDetailViewCoordinator(navigationController: navigationController, character: character)
        characterDetailViewCordinator.parentCoordinator = self
        childCoordinators.append(characterDetailViewCordinator)
        characterDetailViewCordinator.start()
    }
    
    func startFavoriteView() {
        let favoriteCharactersViewCoordinator = FavoriteCharactersViewCoordinator(navigationController: navigationController)
        favoriteCharactersViewCoordinator.parentCoordinator = self
        childCoordinators.append(favoriteCharactersViewCoordinator)
        favoriteCharactersViewCoordinator.start()
    }
    
    func childDidFinish(){
        childCoordinators.removeLast()
    }
    
}
