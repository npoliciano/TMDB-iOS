//
//  Movie+Extension.swift
//  TMDB
//
//  Created by Nicolle on 02/03/24.
//

import Foundation

extension Movie {
    static var dummy: Movie {
        Movie(
            id: 0,
            title: "--------",
            score: 0.0,
            releaseDate: "--------",
            backdropURL: URL(fileURLWithPath: ""),
            posterURL: URL(fileURLWithPath: "")
        )
    }
}
