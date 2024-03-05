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
                switch viewModel.state {
                case .loading:
                    MovieDetailsSkeletonView()
                case .error:
                    ErrorView(
                        message: "Could not get details of the movie",
                        onTryAgain: {
                            viewModel.getMovieDetails()
                        }
                    )
                    .padding(36)
                case .content(let movieDetails):
                    MovieSummaryView(
                        summary: movieDetails.summary,
                        trailerURL: movieDetails.trailerURL
                    )

                    if !movieDetails.cast.isEmpty {
                        CarouselActorView(cast: movieDetails.cast)
                    }
                }
            }
        }
        .allowsHitTesting(!viewModel.state.isLoading)
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

