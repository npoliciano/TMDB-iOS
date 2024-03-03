//
//  MovieDetailsSkeletonView.swift
//  TMDB
//
//  Created by Nicolle on 02/03/24.
//

import SwiftUI

struct MovieDetailsSkeletonView: View {
    var body: some View {
        VStack {
            MovieSummaryView(
                summary: MovieSummary(
                    title: "--------",
                    genres: "-----",
                    backdropURL: URL(fileURLWithPath: ""),
                    posterURL: URL(fileURLWithPath: ""),
                    overview: """
                            ----- ----- ----- ----- ----- ----- ----- ----- -----
                            ----- ----- ----- ----- ----- ----- ----- ----- -----
                            """,
                    releaseDate: "------",
                    releaseYear: "---",
                    runtime: "----",
                    tagline: "-------",
                    voteAverage: 0.0
                ),
                trailerURL: URL(fileURLWithPath: ""),
                isLoading: true
            )
            .redacted(reason: .placeholder)

            CarouselActorView(
                cast: Array(
                    repeating: Actor(
                        name: "-------",
                        profileURL: nil,
                        character: "--------"
                    ),
                    count: 10
                )
            )
            .redacted(reason: .placeholder)
        }
    }
}
