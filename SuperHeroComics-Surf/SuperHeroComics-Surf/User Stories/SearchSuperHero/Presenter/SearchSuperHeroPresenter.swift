//
//  SearchSuperHeroPresenter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 24.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

final class SearchSuperHeroPresenter: SearchSuperHeroViewOutput, SearchSuperHeroModuleInput {
    
    // MARK: - Properties
    
    weak var view: SearchSuperHeroViewInput?
    var router: SearchSuperHeroRouterInput?
    var output: SearchSuperHeroModuleOutput?
    
    // MARK: - Private Properties
    
    private var heroEntites: [HeroEntity] = []
    
    // MARK: - SearchSuperHeroViewOutput
    
    func configure(with text: String) {
        HeroesNetworkManager.shared.fetchHero(searchText: text, onCompletion: { [weak self] result in
            self?.heroEntites = result
            self?.view?.configure(with: result.map { SearchSuperHeroViewModel(with: $0)
            })
        }) { (onError) in
            print(onError.localizedDescription)
        }
    }

    func heroSelected(hero: SearchSuperHeroViewModel) {
        guard let heroEntity = heroEntites.first(where: { $0.id == hero.id }) else {
            return
        }
        router?.showDetailModule(with: heroEntity)
    }
    
    func addToFavorite(hero: SearchSuperHeroViewModel) {
        guard let heroEntity = heroEntites.first(where: { $0.id == hero.id }) else {
            return
        }
        HeroesDatabaseService.heroDatabaseShared.update(heroEntity.toEntry())
    }

}
