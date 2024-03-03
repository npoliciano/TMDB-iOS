//
//  TMDBApp.swift
//  TMDB
//
//  Created by Nicolle on 07/02/24.
//

import SwiftUI

@main
struct TMDBApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .tint(Colors.accent)
        }
    }
}
