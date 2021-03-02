//
//  FavoriteSuperHeroModuleConfigurator.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 01.03.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class FavoriteSuperHeroModuleConfigurator {
    
    func configure(output: FavoriteSuperHeroModuleOutput? = nil) ->
        FavoriteSuperHeroViewController {
            
            let view = FavoriteSuperHeroViewController()
            let presenter = FavoriteSuperHeroPresenter()
            let router = FavoriteSuperHeroRouter()
            
            presenter.view = view
            presenter.router = router
            presenter.output = output
            view.output = presenter

            router.view = view
            
            return view
    }
}

