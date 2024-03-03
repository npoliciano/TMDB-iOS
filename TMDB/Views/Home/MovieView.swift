//
//  MovieView.swift
//  TMDB
//
//  Created by Nicolle on 12/02/24.
//

import SwiftUI
import Kingfisher

struct MovieView: View {
    let movie: Movie
    var isLoading: Bool = false

    var body: some View {
        VStack(spacing: 16) {
            ZStack(alignment: .bottomLeading) {
                KFImage(movie.posterURL)
                    .fade(duration: 0.25)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 240)
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                if !isLoading {
                    ScoreView(size: .compact, score: movie.score)
                        .offset(x: 12, y: 15)
                }
            }

            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.callout)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(movie.releaseDate)
                    .font(.caption)
                    .foregroundStyle(.primary.opacity(0.7))
            }
            .padding(.leading, 12)
            .padding([.vertical, .trailing], 8)
        }
        .frame(width: 160)
        .redacted(reason: isLoading ? .placeholder : .invalidated)
    }
}

#Preview(
    "Movie View",
    traits: .sizeThatFitsLayout
) {
    MovieView(
        movie: Movie(
            id: 0,
            title: "Dune Part II",
            score: 0.5,
            releaseDate: "Feb 09, 2024",
            backdropURL: URL(string: "https://image.tmdb.org/t/p/w780/uUiIGztTrfDhPdAFJpr6m4UBMAd.jpg")!,
            posterURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!
        ), 
        isLoading: false
    )
    .padding(8)
}

