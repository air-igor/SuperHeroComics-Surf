//
//  SearchSuperHeroViewModel.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 02.03.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

struct SearchSuperHeroViewModel {
    
    let id: String?
    let image: String?
    let name: String?
    
    init(with entity: HeroEntity) {
        id = entity.id
        image = entity.image?.url
        name = entity.name
    }
    
}
