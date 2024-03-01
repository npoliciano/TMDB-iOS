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
            VStack(spacing: 32) {
                if let summary = viewModel.movieDetails?.summary {
                    MovieSummaryView(summary: summary)
                }

                if let cast = viewModel.movieDetails?.cast {
                    CarouselActorView(cast: cast)
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

