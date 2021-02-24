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
    
    private var cells: [UITableViewCell] = []
    private var tableView: UITableView
    
    // MARK: - Initialization
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        configureTableView()
    }
    
    // MARK: - Internal methods
    
    func configure(with items: DetailSuperHeroViewModel) {
        configureCells(with: items)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension DetailSuperHeroTableViewAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
    
}

// MARK: - Private Methods

private extension DetailSuperHeroTableViewAdapter {
    
    func configureCells(with model: DetailSuperHeroViewModel) {
        if
            let headerModel = model.header,
            let cell = DetailSuperHeroTableViewCell.loadFromNib() as? DetailSuperHeroTableViewCell {
            cell.configure(with: headerModel)
            self.cells.append(cell)
        }
        
        let cells = [
            model.biographyParameters,
            model.workParameters,
            model.connectionsParamaters
            ].compactMap {$0}.map { model -> UITableViewCell in
                guard let cell = DetailSuperHeroParametersTableViewCell.loadFromNib() as? DetailSuperHeroParametersTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(with: model.title, with: model)
                
                return cell
        }
        self.cells.append(contentsOf: cells)
    }
    
    func configureTableView() {
        tableView.registerCell(type: DetailSuperHeroTableViewCell.self)
        tableView.registerCell(type: DetailSuperHeroParametersTableViewCell.self)
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
    }
    
}
