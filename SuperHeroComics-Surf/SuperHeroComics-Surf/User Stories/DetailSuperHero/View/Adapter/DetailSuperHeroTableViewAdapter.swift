//
//  DetailSuperHeroTableViewAdapter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 17.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class DetailSuperHeroTableViewAdapter: NSObject {
    
    // MARK: - Private properties
        
    private var items: [DetailSuperHeroViewModel] = []
    private var tableView: UITableView
    
    // MARK: - Initialization
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        configureTableView()
    }
    
    // MARK: - Internal methods

    func configure(with items: [DetailSuperHeroViewModel]) {
        self.items = items
        tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension DetailSuperHeroTableViewAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: DetailSuperHeroTableViewCell.self, for: indexPath) as? DetailSuperHeroTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(with: items[indexPath.row])
        
        return cell
    }

}

// MARK: - Private Methods

private extension DetailSuperHeroTableViewAdapter {
    
    func configureTableView() {
        tableView.registerCell(type: DetailSuperHeroTableViewCell.self)
        tableView.registerCell(type: DetailSuperHeroReusableTableViewCell.self)
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
    }

}
