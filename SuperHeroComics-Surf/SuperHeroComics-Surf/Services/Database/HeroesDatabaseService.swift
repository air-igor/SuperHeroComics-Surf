//
//  HeroesDatabaseService.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 26.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import RealmSwift

final class HeroesDatabaseService: MainDatabaseService {
    static let sshared = HeroesDatabaseService()
    
    
    func getHeroesFromDatabase(onCompletion: @escaping ([MiniHeroEntity]) -> Void, onError: ((String) -> Void)? = nil) {
        let hero = realm.objects(HeroesEntry.self)
        guard !hero.isEmpty else {
            onError?("error")
            return
        }
        
        onCompletion(fromEntryToEntity(entry: hero))
    }
    
    func fromEntryToEntity(entry: Results<HeroesEntry>) -> [MiniHeroEntity] {
        var heroesEntity: [MiniHeroEntity] = []
        entry.forEach { (heroEntry) in
            heroesEntity.append(MiniHeroEntity(name: heroEntry.name,
                                               image: heroEntry.image))
        }
        return heroesEntity
    }
}
