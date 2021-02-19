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
        
    private var items: [HeroList] = []
    private var tableView: UITableView?
    
    // MARK: - Iternal methods
    
    func set(tableView: UITableView) {
        tableView.register(UINib(nibName: "DetailSuperHeroTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView?.delegate = tableView.delegate
        self.tableView?.dataSource = tableView.dataSource
        configureTable()
    }
    
    func set(items: [HeroList]) {
        self.items = items
    }
    
    func configureTable() {
        tableView?.showsVerticalScrollIndicator = false
        tableView?.showsHorizontalScrollIndicator = false
        tableView?.separatorStyle = .none
    }
}

// MARK: - UITableViewDataSource

extension DetailSuperHeroTableViewAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailSuperHeroTableViewCell
        cell.setCell(heroes: items[indexPath.row])
        
        return cell
    }
    
}
