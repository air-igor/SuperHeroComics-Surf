//
//  FavoriteSuperHeroPresenter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 01.03.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

final class FavoriteSuperHeroPresenter: FavoriteSuperHeroViewOutput, FavoriteSuperHeroModuleInput {
    
    // MARK: - Properties
    
    var view: FavoriteSuperHeroViewInput?
    var router: FavoriteSuperHeroInput?
    var output: FavoriteSuperHeroModuleOutput?
    
    // MARK: - FavoriteSuperHeroViewOutput
    
    func viewLoaded() {
        HeroesDatabaseService.heroDatabaseShared.getHeroesFromDatabase(completionHandler: { [weak self] entities in
            self?.view?.viewModel(array: entities.map { SearchSuperHeroViewModel(with: $0) })
        }) { (error) in
            print(error)
        }
    }
}

