//
//  SearchSuperHeroConfigurator.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 24.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class SearchSuperHeroModuleConfigurator {
    
    // MARK: - Internal methods
    
    func configure(output: SearchSuperHeroModuleOutput? = nil) -> SearchSuperHeroViewController {
        
        let view = SearchSuperHeroViewController()
        let presenter = SearchSuperHeroPresenter()
        let router = SearchSuperHeroRouter()
        
        presenter.output = output
        presenter.view = view
        presenter.router = router
        
        router.view = view
        view.output = presenter
        
        return view
    }
}
