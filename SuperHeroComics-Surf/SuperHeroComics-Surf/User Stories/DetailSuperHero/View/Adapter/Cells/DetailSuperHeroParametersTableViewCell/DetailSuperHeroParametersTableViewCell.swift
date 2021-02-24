//
//  DetailSuperHeroParametersTableViewCell.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 21.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class DetailSuperHeroParametersTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var parametersView: UIView!
    @IBOutlet private weak var headerTitle: UILabel!
    @IBOutlet private weak var parameterStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setApperance()
    }
    
    func configure(with title: String?) {
        headerTitle.text = title
    }
    
    private func setApperance() {
        parametersView.backgroundColor = UIColor.init(rgb: 0xF1F1F1)
        parametersView.layer.cornerRadius = 8
    }
    
}
