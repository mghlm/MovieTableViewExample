//
//  GalleryCell.swift
//  MovieTableViewExample
//
//  Created by magnus holm on 22/08/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class GalleryCell: UITableViewCell {
    
    // MARK: - Dependencies
    
    var imagesSection: ImagesSection!
    
    // MARK: - Private properties
    
    fileprivate var collectionView: UICollectionView!
    
    // MARK: - Public methods
    
    func configure(with imagesSection: ImagesSection) {
        self.imagesSection = imagesSection
        
        setupUI()
    }
    
    // MARK: - Private methods
    
    fileprivate func setupUI() {
        
        
        
        let layout = UICollectionViewFlowLayout()
//        let size = UIScreen.main.bounds.width
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (width - 40) / 3, height: (width - 40) / 3)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: UIScreen.main.bounds.width)
    }
}

extension GalleryCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = indexPath.row % 2 == 0 ? .red : .green 
        return cell
    }
    
}
