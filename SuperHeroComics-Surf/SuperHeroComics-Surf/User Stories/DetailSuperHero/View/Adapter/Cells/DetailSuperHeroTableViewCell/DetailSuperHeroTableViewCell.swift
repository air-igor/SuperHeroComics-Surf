//
//  DetailSuperHeroTableViewCell.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 17.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class DetailSuperHeroTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var heroView: UIView!
    @IBOutlet private weak var heroAvatar: UIImageView!
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var powerStats: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func configure(with model: DetailSuperHeroViewModel) {
        guard let heroAvatarUrl = model.heroAvatar else { return }
        heroAvatar.loadImage(urlSting: heroAvatarUrl)
        heroName.text = model.heroName
        powerStats.text = model.heroPowerStats
        
    }
    
    func setStyle() {
        heroView.backgroundColor = UIColor.init(rgb: 0xF1F1F1)
        heroView.layer.cornerRadius = 8
        heroAvatar.contentMode = .scaleAspectFill
        heroAvatar.layer.cornerRadius = 8
        powerStats.numberOfLines = 0
        
    }
    
}






