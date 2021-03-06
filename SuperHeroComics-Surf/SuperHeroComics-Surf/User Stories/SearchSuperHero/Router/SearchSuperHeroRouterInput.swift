//
//  SearchSuperHeroRouterInput.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 24.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

protocol SearchSuperHeroRouterInput {
    func showDetailModule(with hero: HeroEntity)
    func showMessageModule(with message: String)
}
