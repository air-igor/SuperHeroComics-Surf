//
//  HomeSuperHeroPresenter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

final class HomeSuperHeroPresenter: HomeSuperHeroViewOutput, HomeSuperHeroModuleInput, HomeSuperHeroAdapterOutput {
    
    // MARK: - Properties
    
    var view: HomeSuperHeroViewInput?
    var router: HomeSuperHeroRouterInput?
    var output: HomeSuperHeroModuleOutput?
    var adapter: HomeSuperHeroCollectionViewAdapter?
    
    // MARK: - Internal methods
    
    func configure() {
        HeroesNetworkManager.shared.fetchRandomHeroesList(onCompletion: { [weak self] (HeroesList) in
            self?.view?.viewModel(array: HeroesList)
        }) { (OnError) in
            self.router?.showMessageModule(with: "\(OnError.localizedDescription)")
        }
    }
    
    func show(heroes: HeroList) {
        router?.showDetailModule(heroes: heroes)
    }
}
