//
//  DetailSuperHeroViewModel.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 20.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import Foundation

struct DetailSuperHeroHeaderViewModel {
    let avatar: String?
    let name: String?
    let powerStats: [String]?
    
    init(avatar: String? = nil, name: String?, powerStats: [String]? = nil) {
        self.avatar = avatar
        self.name = name
        self.powerStats = powerStats
    }
    
}

struct DetailSuperHeroParametersViewModel {
    let title: String?
    
    init(title: String? = nil) {
        self.title = title
    }
}


struct DetailSuperHeroViewModel {
    var header: DetailSuperHeroHeaderViewModel? = nil
    let biographyParameters: DetailSuperHeroParametersViewModel?
    let workParameters: DetailSuperHeroParametersViewModel?
    let connectionsParamaters: DetailSuperHeroParametersViewModel?
    
    init(with entity: HeroList) {
        if let name = entity.name {
            let powerStats = [
                "Intelligence: \(entity.powerstats?.intelligence ?? "0")",
                "Strength: \(entity.powerstats?.strength ?? "0")",
                "Speed: \(entity.powerstats?.speed ?? "0")",
                "Durability: \(entity.powerstats?.durability ?? "0")",
                "Power: \(entity.powerstats?.power ?? "0")",
                "Combat: \(entity.powerstats?.combat ?? "0")"
            ]
            self.header = .init(avatar: entity.image?.url,
                                name: name,
                                powerStats: powerStats)
        }
        
        self.biographyParameters = .init(title: "Biography")
        self.workParameters = .init(title: "Work")
        self.connectionsParamaters = .init(title: "Connections")
    }
}
