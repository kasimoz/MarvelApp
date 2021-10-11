//
//  CharacterDetailViewCordinator.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import UIKit

final class CharacterDetailViewCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    
    var parentCoordinator : CharactersViewCoordinator?

    let navigationController : UINavigationController
    
    let character : MarvelCharacter
    
    init(navigationController : UINavigationController, character : MarvelCharacter){
        self.navigationController = navigationController
        self.character = character
    }
    
    func start() {
        let characterDetailViewController : CharacterDetailViewController = .instantiate()
        let characterDetailViewModel = CharacterDetailViewModel()
        characterDetailViewModel.coordinator = self
        characterDetailViewModel.character = character
        characterDetailViewController.viewModel = characterDetailViewModel
        navigationController.pushViewController(characterDetailViewController, animated: true)
    }
    
    func didFinishCharacterDetail(){
        parentCoordinator?.childDidFinish()
    }
    
    
    deinit {
        print("deinit CharacterDetailViewCoordinator")
    }
    
}
