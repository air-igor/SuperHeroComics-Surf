//
//  SearchSuperHeroTableViewAdapter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 24.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

//protocol SearchSuperHeroTableViewAdapterOutput {
//    func show(heroes: HeroEntity)
//}

final class SearchSuperHeroTableViewAdapter: NSObject {
    
    // MARK: - Private Properties
    
//    private let output: SearchSuperHeroTableViewAdapterOutput
    
    private var items: [HeroEntity] = []
    private var tableView: UITableView
    
    // MARK: - Initialization
    
    init(tableView: UITableView) {
//        self.output = output
        self.tableView = tableView
        super.init()
        configureTable()
    }
    
    // MARK: - Internal methods
    
    func configure(with items: [HeroEntity]) {
        self.items = items
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension SearchSuperHeroTableViewAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: SearchSuperHeroTableViewCell.self) as? SearchSuperHeroTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: items[indexPath.row])
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SearchSuperHeroTableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.output.show(heroes: items[indexPath.row])
    }
}

// MARK: - Private Methods

private extension SearchSuperHeroTableViewAdapter {
    
    func configureTable() {
        tableView.registerCell(type: SearchSuperHeroTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
    }
    
}