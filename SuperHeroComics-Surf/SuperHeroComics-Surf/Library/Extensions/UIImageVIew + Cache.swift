//
//  UIImageVIew + Cache.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

// MARK: - UIImageView Extension

extension UIImageView {
    
    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) {
            image = imageFromCache as? UIImage
            return
        }
        ImageNetworking.downloadImage(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                guard let imageToCache = UIImage(data: data) else { return }
                imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                self.image = UIImage(data: data)
            case .failure(_):
                    self.image = UIImage()
            }
        }
    }
}
