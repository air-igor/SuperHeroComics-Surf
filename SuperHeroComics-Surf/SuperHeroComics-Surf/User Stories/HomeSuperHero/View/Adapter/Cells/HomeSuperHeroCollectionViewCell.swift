//
//  HomeSuperHeroCollectionViewCell.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit
import SDWebImage

final class HomeSuperHeroCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var heroAvatar: UIImageView!
    @IBOutlet private weak var HeroName: UILabel!
    
    // MARK: - Properties
    
    static let sizeCell = CGSize(width: 112, height: 108)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setApperance()
    }
    
    // MARK: - Internal Methods
    
    func configureCell(heroes: HeroEntity) {
        guard let avatarUrl = URL(string: heroes.image?.url ?? "") else { return }
        HeroName.text = heroes.name
        heroAvatar.sd_setImage(with: avatarUrl, placeholderImage: UIImage(named: "noAvatar"), options: .continueInBackground, completed: nil)
        
    }
    
    // MARK: - Private Funcs
    
    private func setApperance() {
        heroAvatar.contentMode = .scaleAspectFill
        heroAvatar.layer.cornerRadius = heroAvatar.frame.height / 2
    }
}
