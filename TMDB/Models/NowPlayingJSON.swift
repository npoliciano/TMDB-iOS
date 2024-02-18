//
//  NowPlayingJSON.swift
//  TMDB
//
//  Created by Nicolle on 15/02/24.
//

import Foundation

struct NowPlayingJSON: Decodable {
    let page: Int
    let results: [MovieJSON]
    let totalPages: Int
}

struct MovieJSON: Decodable {
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: Date
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
