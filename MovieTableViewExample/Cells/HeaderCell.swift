//
//  HeaderCell.swift
//  MovieTableViewExample
//
//  Created by magnus holm on 21/08/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    // MARK: - Dependencies

    var headerSection: HeaderSection! {
        didSet {
            setupPosterImage()
        }
    }
    
    // MARK: - Public methods
    
    func configure(with headerSection: HeaderSection) {
        self.headerSection = headerSection
        
        setupUI()
    }
    
    // MARK: - Private properties
    
    fileprivate var posterImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    fileprivate var movieTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 28)
        return lbl
    }()
    
    // MARK: - Private methods
    
    fileprivate func setupUI() {
        addSubview(posterImageView)
        addSubview(movieTitleLabel)
        
        movieTitleLabel.text = headerSection.movieTitle ?? ""
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        
        posterImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 16, paddingRight: 0, width: 100, height: 100)
        movieTitleLabel.anchor(centerX: nil, centerY: centerYAnchor)
        movieTitleLabel.anchor(top: nil, left: posterImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    fileprivate func setupPosterImage() {
        guard let imageUrl = headerSection.moviePoster else { return }
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to fetch image:", error)
                return
            }
            
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.posterImageView.image = UIImage(data: data)
                self.posterImageView.layer.cornerRadius = 8
                self.posterImageView.clipsToBounds = true 
            }
        }.resume()
    }
}
