//
//  HomeSuperHeroViewController.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class HomeSuperHeroViewController: UIViewController, HomeSuperHeroViewInput, ModuleTransitionable {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Private properties
    
    private let refreshControl = UIRefreshControl()
    private lazy var adapter = HomeSuperHeroCollectionViewAdapter(collectionView: collectionView, output: self)
    
    // MARK: - Properties
    
    var output: HomeSuperHeroViewOutput?
    
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Heroes"
        activityIndicator.startAnimating()
        output?.configure()
        collectionView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(fetchData(_:)), for: .valueChanged)
    }
    
    @objc private func fetchData(_ sender: Any) {
        output?.configure()
        collectionView.reloadData()
    }
    
    // MARK: - Internal methods
    
    func viewModel(array: [HeroEntity]) {
        adapter.configure(with: array)
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        refreshControl.endRefreshing()
    }
}

extension HomeSuperHeroViewController: HomeSuperHeroAdapterOutput {
    func heroSelected(hero: HeroEntity) {
        output?.heroSelected(hero: hero)
    }
    
}

