//
//  PlotCell.swift
//  MovieTableViewExample
//
//  Created by magnus holm on 21/08/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class PlotCell: UITableViewCell {
    
    // MARK: - Dependencies
    
    var descriptionSection: DescriptionSection!
    
    // MARK: - Private properties
    
    fileprivate var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // MARK: - Private methods
    
    fileprivate func configure(with descriptionSection: DescriptionSection) {
        self.descriptionSection = descriptionSection
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        descriptionLabel.text = descriptionSection.description ?? ""
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        descriptionLabel.anchor(centerX: centerXAnchor, centerY: centerYAnchor)
        descriptionLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
    }
}
