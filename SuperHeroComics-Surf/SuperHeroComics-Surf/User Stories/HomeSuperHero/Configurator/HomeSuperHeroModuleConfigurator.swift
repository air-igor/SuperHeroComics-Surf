//
//  HomeSuperHeroModuleConfigurator.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class HomeSuperHeroModuleConfigurator {
    
    func configure(output: HomeSuperHeroModuleOutput? = nil) ->
        HomeSuperHeroViewController {
            
            let view = HomeSuperHeroViewController()
            let presenter = HomeSuperHeroPresenter()
            let router = HomeCocktailListRouter()
            
            presenter.view = view
            presenter.router = router
            presenter.output = output
            router.view = view
            view.output = presenter
            view.adapter = HomeSuperHeroCollectionViewAdapter(output: presenter)
            
            return view
    }
}
