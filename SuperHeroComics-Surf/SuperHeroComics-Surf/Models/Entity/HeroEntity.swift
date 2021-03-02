//
//  HeroEntity.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import Foundation

// MARK: - HeroModel

struct HeroesResultEntity: Codable {
    let response, resultsFor: String?
    let results: [HeroEntity]
    
    enum CodingKeys: String, CodingKey {
        case response
        case resultsFor = "results-for"
        case results
    }
}

// MARK: - HeroEntity

struct HeroEntity: Codable {
    let id, name: String?
    let powerstats: PowerstatsEntity?
    let biography: BiographyEntity?
    let work: WorkEntity?
    let connections: ConnectionsEntity?
    let image: ImageEntity?
    
    func toEntry() -> HeroEntry {
        return HeroEntry.toEntry(from: self)
    }

}

// MARK: - Biography

struct BiographyEntity: Codable {
    let fullName, alterEgos: String?
    let placeOfBirth, firstAppearance, publisher: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher
    }
}

// MARK: - ConnectionsEntity

struct ConnectionsEntity: Codable {
    let groupAffiliation, relatives: String?
    
    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }
}

// MARK: - ImageEntity

struct ImageEntity: Codable {
    let url: String?
}

// MARK: - PowerstatsEntity

struct PowerstatsEntity: Codable {
    let intelligence, strength, speed, durability: String?
    let power, combat: String?
}

// MARK: - WorkEntity

struct WorkEntity: Codable {
    let occupation, base: String?
}
