//
//  Movie.swift
//  MoviesApp
//
//  Created by Arpit Dixit on 08/07/21.
//

import Foundation

struct MoviesResponse: Codable {
    
    let search: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

struct Movie: Codable {
    
    let title: String
    let imdbId: String
    let poster: String
    
    private enum CodingKeys: String,CodingKey {
        case title = "Title"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}
