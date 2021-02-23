//
//  DetailSuperHeroViewModel.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 20.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import Foundation

struct DetailSuperHeroViewModel {
    
    let heroAvatar: String?
    let heroName: String?
    let heroPowerStats: String?
    let heroAlterEgos: String?
    let heroPublisher: String?
    let heroFirstApperance: String?
    let heroOccupation: String?
    let heroRelatives: String?
    let heroGroupAffiliation: String?
    let heroBase: String?
    let heroPlaceOfBirth: String?
//    let headerModel: DetailSuperHeroHeaderViewModel?
//    let detailSuperHeroAdditonalModel: DetailSuperHeroAdditonalModel?
    
    init(with entity: HeroList) {
        heroAvatar = entity.image?.url
        heroName = entity.name
        heroPowerStats = """
        Intelligence: \(entity.powerstats?.intelligence ?? "0")
        Strength: \(entity.powerstats?.strength ?? "0")
        Speed: \(entity.powerstats?.speed ?? "0")
        Durability: \(entity.powerstats?.durability ?? "0")
        Power: \(entity.powerstats?.power ?? "0")
        Combat: \(entity.powerstats?.combat ?? "0")
        """
        heroAlterEgos = "Alter Egos: \n\(entity.biography?.alterEgos ?? "Unknown")"
        
        if entity.biography?.publisher == "-" {
            heroPublisher = "Publisher: \nUnknown"
        } else {
            heroPublisher = "Publisher: \n\(entity.biography?.publisher ?? "")"
        }
        
        if entity.biography?.firstAppearance == "-" {
            heroFirstApperance = "First appereance: \nUnknown"
        } else {
            heroFirstApperance = "First appereance: \n\(entity.biography?.firstAppearance ?? "")"
        }
        
        if entity.work?.occupation == "-" {
            heroOccupation = "Occupation: \nUnknown"
        } else {
            heroOccupation = "Occupation: \n\(entity.work?.occupation ?? "")"
        }
        
        if entity.connections?.relatives == "-" {
            heroRelatives = "Relatives: \nUnknown"
        } else {
            heroRelatives = "Relatives: \n\(entity.connections?.relatives ?? "")"
        }
        
        if entity.connections?.groupAffiliation == "-" {
            heroGroupAffiliation = "Group Affiliation: \nUnknown"
        } else {
            heroGroupAffiliation = "Group Affiliation: \n\(entity.connections?.groupAffiliation ?? "")"
        }
        
        if entity.work?.base == "-" {
            heroBase = "Base: \nUnknown"
        } else {
            heroBase = "Base: \n\(entity.work?.base ?? "")"
        }
        
        if entity.biography?.placeOfBirth == "-" {
            heroPlaceOfBirth = "Place of birth: \nUnknown"
        } else {
            heroPlaceOfBirth = "Place of birth: \n\(entity.biography?.placeOfBirth ?? "")"
        }
    }
    
}

//struct DetailSuperHeroHeaderViewModel {
//    let title: String?
//    let image: String?
//    let powerStats: [String]?
//}
//
//struct DetailSuperHeroAdditonalModel {
//
//}
