//
//  HeroEntry.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 01.03.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import RealmSwift

@objcMembers class HeroEntry: Object {
    
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var powerstats: PowerstatsEntry? = nil
    dynamic var biography: BiographyEntry? = nil
    dynamic var work: WorkEntry? = nil
    dynamic var connections: ConnectionsEntry? = nil
    dynamic var image: ImageEntry? = nil
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    static func toEntry(from entity: HeroEntity) -> HeroEntry {
        let entry = HeroEntry()
        entry.id = entity.id ?? ""
        entry.name = entity.name ?? ""
        
        return entry
    }
    
    func toEntity() -> HeroEntity {
        return HeroEntity(id: id, name: name, powerstats: nil, biography: nil, work: nil, connections: nil, image: nil)
    }
}

@objcMembers class PowerstatsEntry {
    
    dynamic var intelligence: String = ""
    dynamic var strength: String = ""
    dynamic var speed: String = ""
    dynamic var durability: String = ""
    dynamic var power: String = ""
    dynamic var combat: String = ""
    
    init?(with entity: PowerstatsEntity?) {
        guard let entity = entity else {
            return nil
        }
        
        intelligence = entity.intelligence ?? ""
        strength = entity.strength ?? ""
        speed = entity.speed ?? ""
        durability = entity.durability ?? ""
        power = entity.power ?? ""
        combat = entity.combat ?? ""
    }
}

@objcMembers class BiographyEntry {
    
    dynamic var fullName: String = ""
    dynamic var alterEgos: String = ""
    dynamic var placeOfBirth: String = ""
    dynamic var firstAppearance: String = ""
    dynamic var publisher: String = ""
    
    init?(with entity: BiographyEntity?) {
        guard let entity = entity else {
            return nil
        }
        
        fullName = entity.fullName ?? ""
        alterEgos = entity.alterEgos ?? ""
        placeOfBirth = entity.placeOfBirth ?? ""
        firstAppearance = entity.firstAppearance ?? ""
        publisher = entity.publisher ?? ""
        
    }
}

@objcMembers class WorkEntry {
    
    dynamic var occupation: String = ""
    dynamic var base: String = ""
    
    init?(with entity: WorkEntity?) {
        guard let entity = entity else {
            return nil
        }
        
        occupation = entity.occupation ?? ""
        base = entity.base ?? ""
        
    }
}

@objcMembers class ConnectionsEntry {
    
    dynamic var groupAffiliation: String = ""
    dynamic var relatives: String = ""
    
    init?(with entity: ConnectionsEntity?) {
        guard let entity = entity else {
            return nil
        }
        
        groupAffiliation = entity.groupAffiliation ?? ""
        relatives = entity.relatives ?? ""
        
    }
}

@objcMembers class ImageEntry {
    
    dynamic var url: String? = ""
    
    init?(with entity: ImageEntity?) {
        guard let entity = entity else {
            return nil
        }
        
        url = entity.url
    }
}
