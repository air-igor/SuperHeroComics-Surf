//
//  MainTabBarController.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension MainTabBarController {
    func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.title = title
        rootViewController.tabBarItem.title = title
        tabBar.tintColor = .black
        
        return navigationController
    }
}
