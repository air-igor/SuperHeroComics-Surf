//
//  HomeSuperHeroCollectionViewAdapter.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

protocol HomeSuperHeroAdapterOutput {
    func heroSelected(hero: HeroEntity)
}

final class HomeSuperHeroCollectionViewAdapter: NSObject {
    
    // MARK: - Private properties
    
    private let output: HomeSuperHeroAdapterOutput?
    private var items: [HeroEntity] = []
    private var collectionView: UICollectionView?
    
    // MARK: - Initialization
    
    init(collectionView: UICollectionView?, output: HomeSuperHeroAdapterOutput?) {
        self.output = output
        self.collectionView = collectionView
        super.init()
        configureTable()
    }
    
    // MARK: - Internal methods
    
    func configure(with items: [HeroEntity]) {
        self.items = items
        collectionView?.reloadData()
    }
    
}

// MARK: - UICollectionViewDataSource

extension HomeSuperHeroCollectionViewAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueCell(withType:
            HomeSuperHeroCollectionViewCell.self, for: indexPath) as?
            HomeSuperHeroCollectionViewCell else {
                return UICollectionViewCell() }
        
        cell.configureCell(heroes: items[indexPath.row])
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension HomeSuperHeroCollectionViewAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.output?.heroSelected(hero: items[indexPath.row])
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

// MARK: - Private Methods

private extension HomeSuperHeroCollectionViewAdapter {
    
    func configureTable() {
        collectionView?.registerCell(type: HomeSuperHeroCollectionViewCell.self)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
}
