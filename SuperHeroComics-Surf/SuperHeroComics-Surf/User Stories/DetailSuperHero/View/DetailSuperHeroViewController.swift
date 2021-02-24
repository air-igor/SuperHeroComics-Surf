//
//  DetailSuperHeroViewController.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 17.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class DetailSuperHeroViewController: UIViewController, DetailSuperHeroViewInput, ModuleTransitionable {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var output: DetailSuperHeroViewOutput?
    
    // MARK: - Private Properties
    
    private lazy var adapter = DetailSuperHeroTableViewAdapter(tableView: tableView)
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }
    
    // MARK: - DetailSuperHeroViewInput
    
    func configure(with heroes: DetailSuperHeroViewModel) {
        adapter.configure(with: heroes)
    }

}
