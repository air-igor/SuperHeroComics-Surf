//
//  SearchSuperHeroViewOutput.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 24.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

protocol SearchSuperHeroViewOutput: class {
    func configure(with text: String)
    func heroSelected(hero: SearchSuperHeroViewModel)
    func addToFavorite(hero: SearchSuperHeroViewModel)
}
