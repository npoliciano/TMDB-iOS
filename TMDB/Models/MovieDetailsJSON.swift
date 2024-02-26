//
//  MovieDetailsJSON.swift
//  TMDB
//
//  Created by Nicolle on 25/02/24.
//

import Foundation

struct MovieDetailsJSON: Decodable {
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: BelongsToCollectionJSON?
    let budget: Int
    let genres: [GenreJSON]
    let homepage: String
    let id: Int
    let imdbId: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompanyJSON]
    let productionCountries: [ProductionCountryJSON]
    let releaseDate: Date
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [SpokenLanguageJSON]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
struct BelongsToCollectionJSON: Decodable {
    let id: Int
    let name: String
    let posterPath: String
    let backdropPath: String
}

struct GenreJSON: Decodable {
    let id: Int
    let name: String
}

struct ProductionCompanyJSON: Decodable {
    let id: Int
    let logoPath: String
    let name: String
    let originCountry: String
}

struct ProductionCountryJSON: Decodable {
    let iso31661: String
    let name: String
}

struct SpokenLanguageJSON: Decodable {
    let englishName: String
    let iso6391: String
    let name: String
}

