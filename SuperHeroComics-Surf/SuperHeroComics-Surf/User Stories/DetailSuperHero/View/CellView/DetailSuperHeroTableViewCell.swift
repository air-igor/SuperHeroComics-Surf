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
    
    @IBOutlet private weak var heroWorkView: UIView!
    @IBOutlet private weak var heroConnectionsView: UIView!
    @IBOutlet private weak var heroView: UIView!
    @IBOutlet private weak var heroOtherInfoView: UIView!
    @IBOutlet private weak var heroAvatar: UIImageView!
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var powerStats: UILabel!
    @IBOutlet private weak var placeOfBirth: UILabel!
    @IBOutlet private weak var fullName: UILabel!
    @IBOutlet private weak var heroAlterEgos: UILabel!
    @IBOutlet private weak var heroFirstAppereance: UILabel!
    @IBOutlet private weak var heroPublisher: UILabel!
    @IBOutlet private weak var heroOccupation: UILabel!
    @IBOutlet private weak var heroBase: UILabel!
    @IBOutlet private weak var heroGroupAffiliation: UILabel!
    @IBOutlet private weak var heroRelatives: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setCell(heroes: HeroList) {
        heroAvatar.loadImage(urlSting: heroes.image?.url ?? "")
        heroName.text = heroes.name
        fullName.text = "Full Name: \n\(heroes.biography?.fullName ?? "Unknown")"
        heroAlterEgos.text = "Alter Egos: \n\(heroes.biography?.alterEgos ?? "Unknown")"

        if heroes.biography?.publisher == "-" {
            heroPublisher.text = "Publisher: \nUnknown"
        } else {
            heroPublisher.text = "Publisher: \n\(heroes.biography?.publisher ?? "")"
        }
        
        if heroes.biography?.firstAppearance == "-" {
            heroFirstAppereance.text = "First appereance: \nUnknown"
        } else {
            heroFirstAppereance.text = "First appereance: \n\(heroes.biography?.firstAppearance ?? "")"
        }
        
        if heroes.work?.occupation == "-" {
            heroOccupation.text = "Occupation: \nUnknown"
        } else {
            heroOccupation.text = "Occupation: \n\(heroes.work?.occupation ?? "")"
        }
        
        if heroes.connections?.relatives == "-" {
            heroRelatives.text = "Relatives: \nUnknown"
        } else {
            heroRelatives.text = "Relatives: \n\(heroes.connections?.relatives ?? "")"
        }
        
        if heroes.connections?.groupAffiliation == "-" {
            heroGroupAffiliation.text = "Group Affiliation: \nUnknown"
        } else {
            heroGroupAffiliation.text = "Group Affiliation: \n\(heroes.connections?.groupAffiliation ?? "")"
        }
        
        if heroes.work?.base == "-" {
            heroBase.text = "Base: \nUnknown"
        } else {
            heroBase.text = "Base: \n\(heroes.work?.base ?? "")"
        }
        
        if heroes.biography?.placeOfBirth == "-" {
            placeOfBirth.text = "Place of birth: \nUnknown"
        } else {
            placeOfBirth.text = "Place of birth: \n\(heroes.biography?.placeOfBirth ?? "")"
        }
        
        powerStats.text = """
        Intelligence: \(heroes.powerstats?.intelligence ?? "0")
        Strength: \(heroes.powerstats?.strength ?? "0")
        Speed: \(heroes.powerstats?.speed ?? "0")
        Durability: \(heroes.powerstats?.durability ?? "0")
        Power: \(heroes.powerstats?.power ?? "0")
        Combat: \(heroes.powerstats?.combat ?? "0")
        """
    }
    
    func setStyle() {
        heroOtherInfoView.backgroundColor = UIColor.init(rgb: 0xF1F1F1)
        heroView.backgroundColor = UIColor.init(rgb: 0xF1F1F1)
        heroWorkView.backgroundColor = UIColor.init(rgb: 0xF1F1F1)
        heroConnectionsView.backgroundColor = UIColor.init(rgb: 0xF1F1F1)
        
        heroConnectionsView.layer.cornerRadius = 8
        heroWorkView.layer.cornerRadius = 8
        heroView.layer.cornerRadius = 8
        heroOtherInfoView.layer.cornerRadius = 8
        heroAvatar.contentMode = .scaleAspectFill
        heroAvatar.layer.cornerRadius = 8
        powerStats.numberOfLines = 0
        placeOfBirth.numberOfLines = 0
        fullName.numberOfLines = 0
        heroAlterEgos.numberOfLines = 0
        heroFirstAppereance.numberOfLines = 0
        heroOccupation.numberOfLines = 0
        heroBase.numberOfLines = 0
        heroGroupAffiliation.numberOfLines = 0
        heroRelatives.numberOfLines = 0
        heroPublisher.numberOfLines = 0
        
    }
    
}






