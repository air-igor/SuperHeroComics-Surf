//
//  MainDatabaseService.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 26.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import RealmSwift

class MainDatabaseService {
    
    // MARK: - Properties
    
    static let shared = MainDatabaseService()
    var realm = try! Realm()
    
    // MARK: - Internal Methods
    
    func update<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object, update: .modified)
                print("success")
            }
        } catch {
            print("Eror update \(error)")
        }
    }
    
    func save<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print("Eror save \(error)")
        }
    }
    
    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print("Eror delete \(error)")
        }
    }
    
}
