//
//  InfoCell.swift
//  MovieTableViewExample
//
//  Created by magnus holm on 21/08/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    
    // MARK: - Dependencies
    
    var infoSection: InfoSection!
    
    // MARK: - Private properties
    
    fileprivate var keyLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    fileprivate var valueLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    // MARK: - Public methods
    
    func configure(with infoSection: InfoSection) {
        self.infoSection = infoSection
        
        setupUI()
    }
    
    // MARK: - Private methods
    
    fileprivate func setupUI() {
//        keyLabel.text = infoSection.info
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        
        keyLabel.anchor(centerX: nil, centerY: centerYAnchor)
        keyLabel.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        valueLabel.anchor(centerX: nil, centerY: centerYAnchor)
        valueLabel.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    
}
