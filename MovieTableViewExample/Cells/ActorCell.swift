//
//  ActorCell.swift
//  MovieTableViewExample
//
//  Created by magnus holm on 21/08/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class ActorCell: UITableViewCell {
    
    // MARK: - Dependencies
    
    var actorSection: ActorsSection! {
        didSet {
            setupImageView()
        }
    }
    
    // MARK: - Private properties
    
    fileprivate var index: Int!
    
    fileprivate var actorImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    fileprivate var actorNameLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    // MARK: - Public methods
    
    func configure(with actorSection: ActorsSection, for index: Int) {
        self.index = index
        self.actorSection = actorSection
        
        setupUI()
    }
    
    // MARK: - Private methods
    
    fileprivate func setupUI() {
        actorNameLabel.text = actorSection.actors[index].name ?? ""
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        actorImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 0, width: 60, height: 60)
        actorNameLabel.anchor(centerX: nil, centerY: centerYAnchor)
        actorNameLabel.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    fileprivate func setupImageView() {
        guard let imageUrl = actorSection.actors[index].image else { return }
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to fetch image:", error)
                return
            }
            
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.actorImageView.image = UIImage(data: data)
                self.actorImageView.layer.cornerRadius = 30
                self.actorImageView.clipsToBounds = true
            }
            
        }.resume()
    }
}
