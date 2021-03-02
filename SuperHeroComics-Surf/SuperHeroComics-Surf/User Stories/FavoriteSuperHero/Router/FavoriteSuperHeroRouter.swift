//
//  FavoriteSuperHeroRouter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 01.03.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class FavoriteSuperHeroRouter: FavoriteSuperHeroInput {
    
    // MARK: - Properties
    
    weak var view: ModuleTransitionable?
    
    // MARK: - Internal methods
    
    func showMessageModule(with message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        DispatchQueue.main.async {
            self.view?.presentModule(alertController, animated: true, completion: nil)
        }
    }
}
