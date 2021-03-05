//
//  TabBarItem.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 20.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

enum TabBarItem: CaseIterable {
    
    // MARK: - Cases
    
    case home
    case search
    case favorite
    
    // MARK: - Properties
    
    var title: String {
        switch self {
        case .home:
            return "Heroes"
        case .search:
            return "Search"
        case .favorite:
            return "Favorites"
        }
    }
    
    var image: UIImage {
        switch self {
        case .home:
            return UIImage(named: "homeIcon") ?? UIImage()
        case .search:
            return UIImage(named: "searchIcon") ?? UIImage()
        case .favorite:
            return UIImage(named: "favoritesIcon") ?? UIImage()
        }
    }

}
