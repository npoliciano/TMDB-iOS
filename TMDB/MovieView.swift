//
//  MovieView.swift
//  TMDB
//
//  Created by Nicolle on 12/02/24.
//

import SwiftUI

struct MovieView: View {
    let title: String
    let score: Double?
    let releaseDate: String

    var body: some View {
        VStack(spacing: 16) {
            ZStack(alignment: .bottomLeading) {
                Image("dune-backdrop")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 0.4)
                    .padding(.horizontal, 0.4)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 4,
                            topTrailingRadius: 4
                        )
                    )

                ScoreView(score: score)
                    .offset(x: 8, y: 15)
            }

            VStack(alignment: .leading) {
                Text(title)
                    .font(.caption)
                    .fontWeight(.heavy)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(releaseDate)
                    .font(.caption)
                    .foregroundStyle(.primary.opacity(0.7))
            }
            .padding(8)
        }
        .frame(width: 160)
        .clipShape(RoundedRectangle(cornerRadius: 10))

        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5), lineWidth: 0.5)
        )
    }
}

#Preview(
    "Movie View",
    traits: .sizeThatFitsLayout
) {
    MovieView(title: "Dune Part II", score: 0.5, releaseDate: "Feb 09, 2024")
        .padding(8)
}

