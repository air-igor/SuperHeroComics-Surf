//
//  HeroesNetworkManager.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import Foundation

final class HeroesNetworkManager {
    
    // MARK: - Properties
    
    static let shared = HeroesNetworkManager()
    typealias ErrorManager = (Errors) -> Void
    
    // MARK: - Private Properties
    
    private let session = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    
    func fetchRandomHeroesList(onCompletion: @escaping ([HeroEntity]) -> Void,
                               onError: @escaping ErrorManager) {
        let mainUrl = UrlConfiguration.startUrl + UrlConfiguration.apiKey + UrlConfiguration.searchScheme + "\(randomHero(length: 1))"
        
        guard let url = URL(string: mainUrl) else {
            return onError(.errorLink)
        }
        dataTask = session.dataTask(with: url, completionHandler: { (data, _, _) in
            
            guard let data = data else {
                return onError(.errorResponse)
            }
            let decoder = JSONDecoder()
            guard let objects = try? decoder.decode(HeroModel.self, from: data) else {
                return onError(.errorParsing)
            }
            
            DispatchQueue.main.async {
                onCompletion(objects.results)
            }
        })
        
        dataTask?.resume()
    }
    
    func fetchHero(searchText: String,
                   onCompletion: @escaping ([HeroEntity]) -> Void,
                   onError: @escaping ErrorManager) {
        let mainUrl = UrlConfiguration.startUrl + UrlConfiguration.apiKey + UrlConfiguration.searchScheme + "\(searchText.replacingOccurrences(of: " ", with: "%20"))"
        
        guard let url = URL(string: mainUrl) else {
            return onError(.errorLink)
        }
        dataTask = session.dataTask(with: url, completionHandler: { (data, _, _) in
            guard let data = data else {
                return onError(.errorResponse)
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let objects = try? decoder.decode(HeroModel.self, from: data) else {
                return onError(.errorParsing)
            }
            DispatchQueue.main.async {
                onCompletion(objects.results)
            }
        })
        dataTask?.resume()
    }
    
}


private extension HeroesNetworkManager {
    func randomHero(length: Int) -> String {
        let letters = "qwertyuiopasdfghjklzxcvbnm"
        return String((0..<length).map{ _ in (letters.randomElement()!) })
    }
}
