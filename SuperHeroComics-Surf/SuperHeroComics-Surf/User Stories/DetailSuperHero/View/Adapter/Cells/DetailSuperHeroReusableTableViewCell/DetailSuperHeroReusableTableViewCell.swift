//
//  DetailSuperHeroReusableTableViewCell.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 21.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

final class DetailSuperHeroReusableTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var parameterStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
