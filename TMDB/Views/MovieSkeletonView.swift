//
//  MovieSkeletonView.swift
//  TMDB
//
//  Created by Nicolle on 16/02/24.
//

import SwiftUI

struct MovieSkeletonView: View {
    var body: some View {
        MovieView(
            movie: Movie(
                id: 0,
                title: "--------",
                score: 0.0,
                releaseDate: "--------",
                backdropURL: URL(string: "http://dummy.com")!,
                posterURL: URL(string: "http://dummy.com")!
            ),
            isLoading: true
        )
    }
}

#Preview {
    MovieSkeletonView()
}
