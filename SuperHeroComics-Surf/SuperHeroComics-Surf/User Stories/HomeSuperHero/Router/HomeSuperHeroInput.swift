//
//  HomeSuperHeroInput.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

protocol HomeSuperHeroRouterInput {
    func showDetailModule(heroes: HeroEntity)
    func showMessageModule(with message: String)
}
