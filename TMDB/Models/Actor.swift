//
//  Actor.swift
//  TMDB
//
//  Created by Nicolle on 28/02/24.
//

import Foundation

struct Actor: Identifiable {
    let id = UUID()
    let name: String
    let profileURL: URL?
    let character: String
}
