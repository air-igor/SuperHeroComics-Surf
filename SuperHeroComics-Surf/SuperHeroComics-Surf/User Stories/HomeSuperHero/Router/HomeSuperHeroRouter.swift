//
//  HomeSuperHeroRouter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class HomeCocktailListRouter: HomeSuperHeroRouterInput {
    
    // MARK: - Properties
    
    weak var view: ModuleTransitionable?
    
    // MARK: - Internal methods
    
    func showDetailModule(heroes: HeroEntity) {
        self.view?.push(module: DetailSuperHeroModuleConfigurator.configure(heroes: heroes), animated: true)
    }
    
    func showMessageModule(with message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        DispatchQueue.main.async {
            self.view?.presentModule(alertController, animated: true, completion: nil)
        }
    }
}
