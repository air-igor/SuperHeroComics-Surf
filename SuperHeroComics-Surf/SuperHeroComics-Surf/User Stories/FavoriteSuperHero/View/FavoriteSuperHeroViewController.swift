//
//  FavoriteSuperHeroViewController.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 01.03.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class FavoriteSuperHeroViewController: UIViewController, FavoriteSuperHeroViewInput, ModuleTransitionable {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var output: FavoriteSuperHeroViewOutput?
    
    // MARK: - Private properties
    
    private lazy var adapter = FavoriteSuperHeroTableViewAdapter(tableView: tableView)
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        output?.viewLoaded()
    }
    
    func viewModel(array: [SearchSuperHeroViewModel]) {
        adapter.configure(with: array)
    }
    
}
