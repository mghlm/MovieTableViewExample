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
    
    fileprivate var movieTableView: UITableView = {
        let tv = UITableView()
        tv.register(HeaderCell.self, forCellReuseIdentifier: "headerCell")
        tv.register(PlotCell.self, forCellReuseIdentifier: "plotCell")
        tv.register(InfoCell.self, forCellReuseIdentifier: "infoCell")
        tv.register(ActorCell.self, forCellReuseIdentifier: "actorCell")
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    fileprivate func setupUI() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        view.addSubview(movieTableView)
        
        if let movie = mapJson(with: "movie") {
            viewModel = SectionViewModel(movie: movie)
        }
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        movieTableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    fileprivate func mapJson(with file: String) -> Movie? {
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sections[section].title
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.sections[indexPath.section]
        
        switch section.sectionType {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderCell
            cell.configure(with: section as! HeaderSection)
            return cell
        case .plot:
            let cell = tableView.dequeueReusableCell(withIdentifier: "plotCell") as! PlotCell
            cell.configure(with: section as! DescriptionSection)
            return cell
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! InfoCell
            cell.configure(with: section as! InfoSection, for: indexPath.row)
            return cell
        case .actors:
            let cell = tableView.dequeueReusableCell(withIdentifier: "actorCell") as! ActorCell
            cell.configure(with: section as! ActorsSection, for: indexPath.row)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell")
            return cell!
        }
        
    }
    
}
