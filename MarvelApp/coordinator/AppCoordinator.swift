//
//  AppCoordinator.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start()
}

class AppCoordinator: Coordinator {
    
    internal var childCoordinators: [Coordinator] = []
    
    private var window : UIWindow
    
    init(window : UIWindow){
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        navigationController.navigationBar.setTitleAttributes()
        
        let charactersViewCoordinator = CharactersViewCoordinator(navigationController: navigationController)
        childCoordinators.append(charactersViewCoordinator)
        charactersViewCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        
    }

}
