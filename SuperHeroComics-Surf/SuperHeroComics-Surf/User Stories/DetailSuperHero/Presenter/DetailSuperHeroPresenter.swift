//
//  DetailSuperHeroPresenter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 17.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//


final class DetailSuperHeroPresenter: DetailSuperHeroViewOutput, DetailSuperHeroModuleInput {

    // MARK: - Properties
    
    weak var view: DetailSuperHeroViewInput?
    var router: DetailSuperHeroRouter?
    var output: DetailSuperHeroModuleOutput?
    
    // MARK: - Private Properties
    
    private let hero: HeroEntity
    
    // MARK: - Initialization
    
    init(with hero: HeroEntity) {
        self.hero = hero
    }
    
    // MARK: - DetailModuleInput
    
    func viewLoaded() {
        view?.configure(with: DetailSuperHeroViewModel(with: hero))
    }
    
    
}
