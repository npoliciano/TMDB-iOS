//
//  CarouselView.swift
//  TMDB
//
//  Created by Nicolle on 14/02/24.
//

import SwiftUI

struct CarouselView: View {
    let title: String
    let list: [Movie]
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(list) { movie in
                        MovieView(movie: movie)
                    }
                    SeeAllView()
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CarouselView(
        title: "Discover", list: [
            Movie(title: "Dune Part II", score: 0.5, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/ldfCF9RhR40mppkzmftxapaHeTo.jpg")!),
            Movie(title: "Dune Part II", score: 0.8, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/AcoVfiv1rrWOmAdpnAMnM56ki19.jpg")!),
            Movie(title: "Dune Part II", score: nil, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!),
            Movie(title: "Dune Part II", score: 0.2, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!)
        ]
    )
}
