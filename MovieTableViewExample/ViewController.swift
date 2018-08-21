//
//  ViewController.swift
//  MovieTableViewExample
//
//  Created by magnus holm on 13/08/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var viewModel: SectionViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    fileprivate func setupUI() {
        if let movie = mapJson(with: "movie") {
            viewModel = SectionViewModel(movie: movie)
        }
    }
    
    func mapJson(with file: String) -> Movie? {
        if let path = Bundle.main.path(forResource: file, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Movie.self, from: data)
                return jsonData
            } catch {
                print("Error parsing")
            }
        }
        return nil
    }
}

