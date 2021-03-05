//
//  FavoriteSuperHeroTableViewAdapter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 01.03.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class FavoriteSuperHeroTableViewAdapter: NSObject {
    
    // MARK: - Private Properties
    private var items: [SearchSuperHeroViewModel] = []
    private var tableView: UITableView
    
    // MARK: - Initialization
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        configureTable()
    }
    
    // MARK: - Internal methods
    
    func configure(with items: [SearchSuperHeroViewModel]) {
        self.items = items
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension FavoriteSuperHeroTableViewAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: FavoriteSuperHeroTableViewCell.self) as? FavoriteSuperHeroTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: items[indexPath.row])
        
        return cell
    }
}

// MARK: - Private Methods

private extension FavoriteSuperHeroTableViewAdapter {
    
    func configureTable() {
        tableView.registerCell(type: FavoriteSuperHeroTableViewCell.self)
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .singleLine
    }
    
}
