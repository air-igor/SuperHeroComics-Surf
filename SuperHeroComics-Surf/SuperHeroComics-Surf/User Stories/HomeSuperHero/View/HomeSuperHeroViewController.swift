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
    
    // MARK: - Properties
    
    var adapter: HomeSuperHeroCollectionViewAdapter?
    var output: HomeSuperHeroViewOutput?
    
    
    // MARK: - ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter?.set(collectionView: collectionView)
        collectionView.delegate = adapter
        collectionView.dataSource = adapter
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
    
    func viewModel(array: [HeroList]) {
        adapter?.set(items: array)
        collectionView.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        refreshControl.endRefreshing()
    }
}
