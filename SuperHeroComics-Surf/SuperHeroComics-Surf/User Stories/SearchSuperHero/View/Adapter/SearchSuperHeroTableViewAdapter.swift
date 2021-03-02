//
//  SearchSuperHeroTableViewAdapter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 24.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

protocol SearchSuperHeroTableViewAdapterOutput {
    func heroSelected(hero: SearchSuperHeroViewModel)
    func addToFavorite(hero: SearchSuperHeroViewModel)
}

final class SearchSuperHeroTableViewAdapter: NSObject {
    
    // MARK: - Private Properties
    
    private let output: SearchSuperHeroTableViewAdapterOutput?
    
    private var items: [SearchSuperHeroViewModel] = []
    private var tableView: UITableView
    
    // MARK: - Initialization
    
    init(tableView: UITableView, output: SearchSuperHeroTableViewAdapterOutput?) {
        self.output = output
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
        self.output?.heroSelected(hero: items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { [weak self] _, index in
            if let item = self?.items[index.row] {
                self?.output?.addToFavorite(hero: item)
            }
        }
        
        favorite.backgroundColor = .orange
        
        return [favorite]
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
