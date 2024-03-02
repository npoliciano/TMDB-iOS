//
//  VideosJSON.swift
//  TMDB
//
//  Created by Nicolle on 02/03/24.
//

import Foundation

struct VideosJSON: Decodable {
    let id: Int
    let results: [VideoJSON]
}

struct VideoJSON: Decodable {
    let iso6391: String
    let iso31661: String
    let name: String
    let key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt: String
    let id: String
}
