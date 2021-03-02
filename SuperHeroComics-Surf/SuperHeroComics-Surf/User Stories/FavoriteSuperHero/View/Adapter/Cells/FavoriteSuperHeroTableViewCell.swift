//
//  FavoriteSuperHeroTableViewCell.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 01.03.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class FavoriteSuperHeroTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: SearchSuperHeroViewModel) {
        titleLabel.text = model.name
    }
    
}
