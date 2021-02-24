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
    
    func configure(with title: String?, with model: DetailSuperHeroParametersViewModel) {
        headerTitle.text = title
        if let parameters = model.parameters {
            parameters.forEach {
                let label = UILabel()
                label.text = $0
                label.numberOfLines = 0
                label.font = UIFont(name: "Gill Sans", size: 18)
                parameterStackView.addArrangedSubview(label)
            }
        }
    }
    
    private func setApperance() {
        parametersView.backgroundColor = UIColor().heroCustomViewColor
        parametersView.layer.cornerRadius = 8
    }
    
}
