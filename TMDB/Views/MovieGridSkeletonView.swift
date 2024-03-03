//
//  MovieGridSkeletonView.swift
//  TMDB
//
//  Created by Nicolle on 02/03/24.
//

import SwiftUI

struct MovieGridSkeletonView: View {
    let columns: Int

    private let rows = 10

    var body: some View {
        ForEach(0...rows, id: \.self) { _ in
            GridRow {
                ForEach(0 ..< columns, id: \.self) { _ in
                    MovieBackdropView(
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
                    .padding()
                }
            }
        }
    }
}

#Preview {
    MovieGridSkeletonView(columns: 2)
}
