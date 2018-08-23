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
        lbl.font = UIFont.italicSystemFont(ofSize: 18)
        return lbl
    }()
    
    // MARK: - Public methods 
    
    func configure(with descriptionSection: DescriptionSection) {
        self.descriptionSection = descriptionSection
        
        setupUI()
    }
    
    // MARK: - Private methods
    
    fileprivate func setupUI() {
        addSubview(descriptionLabel)
        
        descriptionLabel.text = descriptionSection.description ?? ""
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        descriptionLabel.anchor(centerX: centerXAnchor, centerY: centerYAnchor)
        descriptionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 0)
    }
}
