//
//  HeroesEntry.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 26.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import RealmSwift

@objcMembers class HeroesEntry: Object, Codable {
    dynamic var name = ""
    dynamic var image = ""
    
    
    override class func primaryKey() -> String? {
        return "name"
    }
    
    func commonInit(name: String?, image: String?) -> Object {
        let hero = HeroesEntry()
        hero.name = name ?? ""
        hero.image = image ?? ""
        
        return hero
    }
}
