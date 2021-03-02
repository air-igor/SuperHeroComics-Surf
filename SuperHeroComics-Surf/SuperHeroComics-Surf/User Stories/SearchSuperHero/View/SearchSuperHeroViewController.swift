//
//  SearchSuperHeroViewController.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 24.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class SearchSuperHeroViewController: UIViewController, SearchSuperHeroViewInput, ModuleTransitionable  {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties

    var output: SearchSuperHeroViewOutput?
    
    // MARK: - Private Properties
    
    private var timer: Timer?
    private let searchController = UISearchController(searchResultsController: nil)
    
    private lazy var adapter = SearchSuperHeroTableViewAdapter(tableView: tableView, output: self)
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        setupSearchBar()
    }
    
    // MARK: Internal Methods
    
    func configure(with heroes: [SearchSuperHeroViewModel]) {
        adapter.configure(with: heroes)
    }
    
    
}

// MARK: - SearchSuperHeroTableViewAdapterOutput

extension SearchSuperHeroViewController: SearchSuperHeroTableViewAdapterOutput {
    
    func heroSelected(hero: SearchSuperHeroViewModel) {
        output?.heroSelected(hero: hero)
    }
    
    func addToFavorite(hero: SearchSuperHeroViewModel) {
        output?.addToFavorite(hero: hero)
    }

}

// MARK: - UISearchBarDelegate

extension SearchSuperHeroViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false, block: { (_) in
            if searchText == "" {
                self.configure(with: [])
            } else {
                self.output?.configure(with: searchText)
            }
        })
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        configure(with: [])
    }
    
}

// MARK: - Private Methods

private extension SearchSuperHeroViewController {
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}
