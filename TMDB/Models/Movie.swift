//
//  Movie.swift
//  TMDB
//
//  Created by Nicolle on 14/02/24.
//

import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let score: Double
    let releaseDate: String
    let backdropURL: URL
    let posterURL: URL
}
