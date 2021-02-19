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
    var output: DetailSuperHeroViewOutput?
    var heroes: [HeroList]?
    
    // MARK: - DetailModuleInput
    
    func configureModule(with heroes: [HeroList]) {
        self.heroes = heroes
        
    }
    
    func setData() {
        view?.configure(with: heroes!)
    }
    
    
}
