//
//  HeroesDatabaseService.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 26.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import RealmSwift

final class HeroesDatabaseService: MainDatabaseService {
    static let heroDatabaseShared = HeroesDatabaseService()
    
    func getHeroesFromDatabase(completionHandler: @escaping ([HeroEntity]) -> Void, errorHandler: ((String) -> Void)? = nil) {
        let heroEntries = realm.objects(HeroEntry.self)
        guard !heroEntries.isEmpty else {
            errorHandler?("error")
            return
        }
        
        completionHandler(heroEntries.map { $0.toEntity() })
    }
    
}
