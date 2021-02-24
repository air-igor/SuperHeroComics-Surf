//
//  MainTabBarController.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    // MARK: - UITabBarController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = TabBarItem.allCases.map { makeModule(with: $0) }
    }

}

// MARK: - UITabBarController

private extension MainTabBarController {

    func makeModule(with type: TabBarItem) -> UIViewController {
        switch type {
        case .home:
            let view = HomeSuperHeroModuleConfigurator().configure()
            return makeRootNavigationController(with: view, title: type.title, image: type.image)
        case .search:
            let view = SearchSuperHeroModuleConfigurator().configure()
            return makeRootNavigationController(with: view, title: type.title, image: type.image)
        }
    }
    
    func makeRootNavigationController(with rootViewController: UIViewController,
                                      title: String,
                                      image: UIImage) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.title = title
        rootViewController.tabBarItem.title = title
        tabBar.tintColor = .black
        
        return navigationController
    }

}
