//
//  MovieBackdropView.swift
//  TMDB
//
//  Created by Nicolle on 17/02/24.
//

import SwiftUI
import Kingfisher

struct MovieBackdropView: View {
    let movie: Movie
    var isLoading: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if isLoading {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.quaternary)
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
            } else {
                KFImage(movie.backdropURL)
                    .resizable()
                    .scaledToFit()
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    Text(movie.releaseDate)
                        .font(.subheadline)
                        .foregroundStyle(.primary.opacity(0.7))
                }
                Spacer()

                if !isLoading {
                    ScoreView(size: .regular, score: movie.score)
                        .offset(x: 0, y: -35)
                }
            }
            .padding(.trailing)
            .redacted(reason: isLoading ? .placeholder : .invalidated)
        }
    }
}

#Preview {
    MovieBackdropView(
        movie: Movie(
            id: 0,
            title: "Dune Part II",
            score: 0.5,
            releaseDate: "Feb 09, 2024",
            backdropURL: URL(string: "https://image.tmdb.org/t/p/w780/uUiIGztTrfDhPdAFJpr6m4UBMAd.jpg")!,
            
            posterURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!
        )
    )
    .padding()
}
