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
    @IBOutlet private weak var powerStatsStackView: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setApperance()
    }
    
    func configure(with model: DetailSuperHeroHeaderViewModel) {
        guard let url = model.avatar else { return }
        heroAvatar.loadImage(urlString: url)
        heroName.text = model.name
        if let powerStats = model.powerStats {
            powerStats.forEach {
                let label = UILabel()
                label.font = UIFont(name: "Avenir", size: 18)
                label.text = $0
                powerStatsStackView.addArrangedSubview(label)
            }
        }
        
    }
    
    // MARK: - Private Func
    
    private func setApperance() {
        heroView.backgroundColor = UIColor().heroCustomViewColor
        heroView.layer.cornerRadius = 8
        heroAvatar.contentMode = .scaleAspectFill
        heroAvatar.layer.cornerRadius = 8        
    }
    
}






