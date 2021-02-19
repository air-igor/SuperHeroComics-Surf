//
//  DetailSuperHeroViewController.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 17.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class DetailSuperHeroViewController: UIViewController, DetailSuperHeroViewInput, ModuleTransitionable {
    
    
    // MARK: - Properties
    
    var adapter: DetailSuperHeroTableViewAdapter?
    var output: DetailSuperHeroViewOutput?
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter?.set(tableView: tableView)
        tableView.dataSource = adapter
        output?.setData()
    }
    
    func configure(with heroes: [HeroList]) {
        adapter?.set(items: heroes)
        tableView.reloadData()
    }
}
