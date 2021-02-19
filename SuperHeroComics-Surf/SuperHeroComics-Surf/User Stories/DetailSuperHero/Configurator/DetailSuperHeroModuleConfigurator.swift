//
//  DetailSuperHeroModuleConfigurator.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 17.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class DetailSuperHeroModuleConfigurator {
    
    // MARK: - Internal methods
    
    static func configure(heroes: [HeroList], output: DetailSuperHeroModuleOutput? = nil) -> DetailSuperHeroViewController {
        
        let view = DetailSuperHeroViewController()
        let presenter = DetailSuperHeroPresenter()
        let router = DetailSuperHeroRouter()
        
        presenter.output = output as? DetailSuperHeroViewOutput
        presenter.view = view
        presenter.router = router
        presenter.configureModule(with: heroes)
        
        router.view = view
        view.output = presenter
        view.adapter = DetailSuperHeroTableViewAdapter()
        
        return view
    }
    
    
}

