//
//  ContentView.swift
//  TMDB
//
//  Created by Nicolle on 07/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 32) {
                CarouselView(title: "Discover", list: [
                    Movie(title: "Dune Part II", score: 0.5, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/ldfCF9RhR40mppkzmftxapaHeTo.jpg")!),
                    Movie(title: "Dune Part II", score: 0.8, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/AcoVfiv1rrWOmAdpnAMnM56ki19.jpg")!),
                    Movie(title: "Dune Part II", score: nil, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!),
                    Movie(title: "Dune Part II", score: 0.2, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!)
                ])
                CarouselView(title: "Upcoming", list: [
                    Movie(title: "Dune Part II", score: 0.5, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/ldfCF9RhR40mppkzmftxapaHeTo.jpg")!),
                    Movie(title: "Dune Part II", score: 0.8, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/AcoVfiv1rrWOmAdpnAMnM56ki19.jpg")!),
                    Movie(title: "Dune Part II", score: nil, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!),
                    Movie(title: "Dune Part II", score: 0.2, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!)
                ])
                CarouselView(title: "Featured", list: [
                    Movie(title: "Dune Part II", score: 0.5, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/ldfCF9RhR40mppkzmftxapaHeTo.jpg")!),
                    Movie(title: "Dune Part II", score: 0.8, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/AcoVfiv1rrWOmAdpnAMnM56ki19.jpg")!),
                    Movie(title: "Dune Part II", score: nil, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!),
                    Movie(title: "Dune Part II", score: 0.2, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!)
                ])
            }
        }
    }
}

#Preview {
    ContentView()
}
