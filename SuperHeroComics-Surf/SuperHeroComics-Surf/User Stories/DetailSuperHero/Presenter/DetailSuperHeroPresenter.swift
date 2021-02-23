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
    
    private let heroes: [HeroList]
    
    // MARK: - Initialization
    
    init(with heroes: [HeroList]) {
        self.heroes = heroes
    }
    
    // MARK: - DetailModuleInput
    
    func viewLoaded() {
        view?.configure(with: heroes.map{ DetailSuperHeroViewModel(with: $0) })
    }
    
    
}
