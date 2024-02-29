//
//  CreditsJSON.swift
//  TMDB
//
//  Created by Nicolle on 28/02/24.
//

import Foundation

struct CreditsJSON: Decodable {
    let cast: [CastJSON]
}

struct CastJSON: Decodable {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String?
    let castId: Int
    let character: String
    let creditId: String
    let order: Int
}
