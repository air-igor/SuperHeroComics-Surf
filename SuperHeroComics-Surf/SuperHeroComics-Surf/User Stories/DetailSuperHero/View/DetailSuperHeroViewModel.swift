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
    let parameters: [String]?
    
    init(title: String? = nil, parameters: [String]? = nil) {
        self.title = title
        self.parameters = parameters
    }
}


struct DetailSuperHeroViewModel {
    
    var header: DetailSuperHeroHeaderViewModel? = nil
    var biographyParameters: DetailSuperHeroParametersViewModel? = nil
    var workParameters: DetailSuperHeroParametersViewModel? = nil
    var connectionsParamaters: DetailSuperHeroParametersViewModel? = nil
    
    init(with entity: HeroEntity) {
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
        
        if entity.biography != nil {
            let allParamaters = [
                "Full Name: \n\(entity.biography?.fullName ?? "")",
                "Alter Egos: \n\(entity.biography?.alterEgos ?? "")"
            ]
            
            self.biographyParameters = .init(title: "Biography", parameters: allParamaters)
        }
        if entity.work != nil {
            let allParamaters = [
                "Occupation: \n\(entity.work?.occupation ?? "")",
                "Base: \n\(entity.work?.base ?? "")"
            ]
            self.workParameters = .init(title: "Work", parameters: allParamaters)
        }
        if entity.connections != nil {
            let allParamaters = [
                "Group Affiliation: \n\(entity.connections?.groupAffiliation ?? "")",
                "Relatives: \n\(entity.connections?.relatives ?? "")"
            ]
            self.connectionsParamaters = .init(title: "Connections", parameters: allParamaters)
        }
    }
}
