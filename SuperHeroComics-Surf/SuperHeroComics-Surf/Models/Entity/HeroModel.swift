//
//  HeroModel.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import Foundation

// MARK: - HeroModel

struct HeroModel: Codable {
    let response, resultsFor: String?
    let results: [HeroList]
    
    enum CodingKeys: String, CodingKey {
        case response
        case resultsFor = "results-for"
        case results
    }
}

// MARK: - HeroList

struct HeroList: Codable {
    let id, name: String?
    let powerstats: Powerstats?
    let biography: Biography?
    let appearance: Appearance?
    let work: Work?
    let connections: Connections?
    let image: Image?
}

// MARK: - Appearance

struct Appearance: Codable {
    let gender, race: String?
    let height, weight: [String]?
    let eyeColor, hairColor: String?
    
    enum CodingKeys: String, CodingKey {
        case gender, race, height, weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }
}

// MARK: - Biography

struct Biography: Codable {
    let fullName, alterEgos: String?
    let placeOfBirth, firstAppearance, publisher, alignment: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher, alignment
    }
}

// MARK: - Connections

struct Connections: Codable {
    let groupAffiliation, relatives: String?
    
    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }
}

// MARK: - Image

struct Image: Codable {
    let url: String?
}

// MARK: - Powerstats

struct Powerstats: Codable {
    let intelligence, strength, speed, durability: String?
    let power, combat: String?
}

// MARK: - Work

struct Work: Codable {
    let occupation, base: String?
}
