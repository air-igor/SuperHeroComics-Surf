//
//  SearchSuperHeroTableViewCell.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 24.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class SearchSuperHeroTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var heroAvatarImageView: UIImageView!
    @IBOutlet private weak var heroNameLabel: UILabel!
    @IBOutlet private weak var heroView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setApperance()
    }
    
    // MARK: - Internal methods
    
    func configure(with model: HeroEntity) {
        guard let url = model.image?.url else { return }
        heroAvatarImageView.loadImage(urlString: url)
        heroNameLabel.text = model.name
    }
    
    // MARK: - Private Func
    
    private func setApperance() {
        heroView.backgroundColor = UIColor().heroCustomViewColor
        heroAvatarImageView.contentMode = .scaleAspectFill
        heroAvatarImageView.layer.cornerRadius = heroAvatarImageView.frame.height / 2
        heroView.layer.cornerRadius = heroView.frame.height / 2
        selectionStyle = .none
    }
    
}
