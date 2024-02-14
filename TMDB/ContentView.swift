//
//  ContentView.swift
//  TMDB
//
//  Created by Nicolle on 07/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                MovieView(title: "Dune Part II", score: 0.5, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/ldfCF9RhR40mppkzmftxapaHeTo.jpg")!)
                MovieView(title: "Dune Part II", score: 0.8, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/AcoVfiv1rrWOmAdpnAMnM56ki19.jpg")!)
                MovieView(title: "Dune Part II", score: nil, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!)
                MovieView(title: "Dune Part II", score: 0.2, releaseDate: "Feb 09, 2024", backdropURL: URL(string: "https://media.themoviedb.org/t/p/w440_and_h660_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!)
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
