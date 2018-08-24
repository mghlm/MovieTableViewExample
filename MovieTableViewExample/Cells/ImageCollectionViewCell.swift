//
//  ImageCollectionViewCell.swift
//  MovieTableViewExample
//
//  Created by magnus holm on 24/08/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private properties
    
    fileprivate var imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    
    // MARK: - Public methods
    
    func configure(with imageUrl: String) {
        let url = URL(string: imageUrl)
        
    }
    
    // MARK: - Private methods
    
    
    
}
