//
//  SectionModel.swift
//  MovieTableViewExample
//
//  Created by magnus holm on 13/08/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var title: String?
    var poster: String?
    var plot: String?
    var info: [Info]?
    var actors: [Actor]?
    var images: [String]?
}

struct Info: Codable {
    var key: String?
    var value: String?
}

struct Actor: Codable {
    var name: String?
    var image: String?
}

/// Section

protocol Section {
    var sectionType: SectionType { get }
    var title: String? { get }
    var cellCount: Int { get }
}

struct HeaderSection: Section {
    var sectionType: SectionType {
        return .header
    }
    var title: String? {
        return nil
    }
    var cellCount: Int {
        return 1
    }
    
    var movieTitle: String?
    var moviePoster: String?
}

struct DescriptionSection: Section {
    var sectionType: SectionType {
        return .plot
    }
    var title: String? {
        return "Description"
    }
    var cellCount: Int {
        return 1
    }
    
    var description: String?
}

struct InfoSection: Section {
    var sectionType: SectionType {
        return .info
    }
    var title: String? {
        return "Information"
    }
    var cellCount: Int {
        return info.count
    }
    
    var info: [Info]
}

struct ActorsSection: Section {
    var sectionType: SectionType {
        return .actors
    }
    var title: String? {
        return "Main actors"
    }
    var cellCount: Int {
        return actors.count
    }
    
    var actors: [Actor]
}

struct ImagesSection: Section {
    var sectionType: SectionType {
        return .images
    }
    var title: String? {
        return "Images"
    }
    var cellCount: Int {
        return 1
    }
    
    var images: [String?]
}

enum SectionType {
    case header, plot, info, actors, images
}

/// ViewModel

struct SectionViewModel {
    
    
    func getSections(for movie: Movie) -> [Section] {
        var sections = [Section]()
        
        if let movieTitle = movie.title, let moviePoster = movie.poster {
            sections.append(HeaderSection(movieTitle: movieTitle, moviePoster: moviePoster))
        }
        
        if let description = movie.plot {
            sections.append(DescriptionSection(description: description))
        }
        
        if let info = movie.info, !info.isEmpty {
            sections.append(InfoSection(info: info))
        }
        
        if let actors = movie.actors, !actors.isEmpty {
            sections.append(ActorsSection(actors: actors))
        }
        
        if let images = movie.images, !images.isEmpty {
            sections.append(ImagesSection(images: images))
        }
        
        return sections
        
    }
    
    
    var sections: [Section]
    
    init(movie: Movie) {
        self.sections = [Section]()
        
        if let movieTitle = movie.title, let moviePoster = movie.poster {
            sections.append(HeaderSection(movieTitle: movieTitle, moviePoster: moviePoster))
        }
        
        if let description = movie.plot {
            sections.append(DescriptionSection(description: description))
        }
        
        if let info = movie.info, !info.isEmpty {
            sections.append(InfoSection(info: info))
        }
        
        if let actors = movie.actors, !actors.isEmpty {
            sections.append(ActorsSection(actors: actors))
        }
        
        if let images = movie.images, !images.isEmpty {
            sections.append(ImagesSection(images: images))
        }
    }
}



