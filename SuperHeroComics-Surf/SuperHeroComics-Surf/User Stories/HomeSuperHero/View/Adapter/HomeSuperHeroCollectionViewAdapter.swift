//
//  HomeSuperHeroCollectionViewAdapter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

protocol HomeSuperHeroAdapterOutput {
    func show(heroes: HeroList)
}

final class HomeSuperHeroCollectionViewAdapter: NSObject {
    
    // MARK: - Private properties
    
    private let output: HomeSuperHeroAdapterOutput
    
    private var items: [HeroList] = []
    private var collectionView: UICollectionView?
    
    // MARK: - Initialization
    
    init(output: HomeSuperHeroAdapterOutput) {
        self.output = output
        
    }
    
    func set(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: "HomeSuperHeroCollectionViewCell",
                                      bundle: nil), forCellWithReuseIdentifier: "cell")
        self.collectionView = collectionView
        configureTable()
        self.collectionView?.delegate = collectionView.delegate
        self.collectionView?.dataSource = collectionView.dataSource
    }
    
    func set(items: [HeroList]) {
        self.items = items
    }
    
    func configureTable() {
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
    }
}

// MARK: - UICollectionViewDataSource

extension HomeSuperHeroCollectionViewAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeSuperHeroCollectionViewCell
        
        cell.configureCell(heroes: items[indexPath.row])
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension HomeSuperHeroCollectionViewAdapter: UICollectionViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //        self.output.show(heroes: Heroes)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeSuperHeroCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionView {
            return HomeSuperHeroCollectionViewCell.sizeCell
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
}
