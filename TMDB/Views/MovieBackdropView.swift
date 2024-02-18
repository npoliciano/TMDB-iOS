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

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            KFImage(movie.backdropURL)
                .resizable()
                .scaledToFit()
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))

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
                ScoreView(size: .regular, score: 7)
                    .offset(x: 0, y: -35)
            }
            .padding(.trailing)
        }
    }
}

#Preview {
    MovieBackdropView(
        movie: Movie(
            title: "Dune Part II",
            score: 0.5,
            releaseDate: "Feb 09, 2024",
            backdropURL: URL(string: "https://image.tmdb.org/t/p/w780/uUiIGztTrfDhPdAFJpr6m4UBMAd.jpg")!, 
            posterURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!
        )
    )
    .padding()
}
