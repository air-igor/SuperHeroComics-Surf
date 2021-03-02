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
    
    static func configure(hero: HeroEntity, output: DetailSuperHeroModuleOutput? = nil) -> DetailSuperHeroViewController {
        
        let view = DetailSuperHeroViewController()
        let presenter = DetailSuperHeroPresenter(with: hero)
        let router = DetailSuperHeroRouter()
        
        presenter.output = output
        presenter.view = view
        presenter.router = router
        
        router.view = view
        view.output = presenter
        
        return view
    }
    
    
}

