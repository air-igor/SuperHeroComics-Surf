//
//  UIColor + Hex.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 19.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(rgb: UInt) {
       self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
}
