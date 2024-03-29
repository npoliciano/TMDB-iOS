//
//  Details.swift
//  TMDB
//
//  Created by Nicolle on 25/02/24.
//

import Foundation

struct MovieSummary {
    let title: String
    let genres: String
    let backdropURL: URL
    let posterURL: URL
    let overview: String
    let releaseDate: String
    let releaseYear: String
    let runtime: String
    let tagline: String
    let voteAverage: Double
}

struct MovieDetails {
    let summary: MovieSummary
    let cast: [Actor]
    let trailerURL: URL?
}
