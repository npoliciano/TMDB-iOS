//
//  MovieDetailsView.swift
//  TMDB
//
//  Created by Nicolle on 26/02/24.
//

import SwiftUI

struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel

    var body: some View {
        ScrollView {
            VStack {
                if let summary = viewModel.movieDetails?.summary {
                    MovieSummaryView(summary: summary)
                }

                Spacer()

                if let cast = viewModel.movieDetails?.cast {
                    Text("Top Billed Cast")
                }
            }
        }
        .toolbarBackground(Colors.navigationBar, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image(.tmdbLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(8)
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .onAppear {
            viewModel.getMovieDetails()
        }
    }
}

#Preview {
    MovieDetailsView(
        viewModel: MovieDetailsViewModel(selectedMovieId: 438631)
    )
}

