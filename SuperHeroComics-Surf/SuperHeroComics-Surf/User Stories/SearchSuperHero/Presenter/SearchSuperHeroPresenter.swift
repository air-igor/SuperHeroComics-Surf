//
//  SearchSuperHeroPresenter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 24.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

final class SearchSuperHeroPresenter: SearchSuperHeroViewOutput, SearchSuperHeroModuleInput, SearchSuperHeroTableViewAdapterOutput {
    
    // MARK: - Properties
    
    weak var view: SearchSuperHeroViewInput?
    var router: SearchSuperHeroRouterInput?
    var output: SearchSuperHeroModuleOutput?
    
    // MARK: - Internal Methods
    
    func configure(with text: String) {
        HeroesNetworkManager.shared.fetchHero(searchText: text, onCompletion: { [weak self] (Result) in
            self?.view?.configure(with: Result)
        }) { (onError) in
            print(onError.localizedDescription)
        }
    }
    
    func show(heroes: HeroEntity) {
        router?.showDetailModule(heroes: heroes)
       }
    
}

