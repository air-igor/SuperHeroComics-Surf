//
//  UICollectionViewCell + RegisterCell.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 23.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UICollectionView Extension

public extension UICollectionView {
    
    /**
     Register nibs faster by passing the type - if for some reason the `identifier` is different then it can be passed
     - Parameter type: UICollectionView.Type
     - Parameter identifier: String?
     */
    func registerCell(type: UICollectionViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: identifier ?? cellId)
    }
    
    /**
     DequeueCell by passing the type of UICollectionViewCell and IndexPath
     - Parameter type: UICollectionViewCell.Type
     - Parameter indexPath: IndexPath
     */
    func dequeueCell<T: UICollectionViewCell>(withType type: UICollectionViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T
    }
    
}

public extension UICollectionReusableView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
