//
//  HomeSuperHeroCollectionViewCell.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class HomeSuperHeroCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet private weak var heroAvatar: UIImageView!
    @IBOutlet private weak var HeroName: UILabel!
    
    // MARK: - Properties
    
    static let sizeCell = CGSize(width: 112, height: 108)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    
    func configureCell(heroes: HeroList) {
        HeroName.text = heroes.name
        
        guard let avatarUrl = heroes.image?.url else { return }
        heroAvatar.loadImage(urlSting: avatarUrl)
    }
    
    private func setStyle() {
        heroAvatar.contentMode = .scaleAspectFill
        heroAvatar.layer.cornerRadius = heroAvatar.frame.height / 2
    }

}
