//
//  CarouselMovieView.swift
//  TMDB
//
//  Created by Nicolle on 14/02/24.
//

import SwiftUI

struct CarouselMovieView: View {
    let title: String
    let isLoading: Bool
    let hasError: Bool
    let movies: [Movie]
    let selectedList: SelectedList
    let onTryAgain: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            SectionTitleView(title: title)
                .redacted(reason: isLoading ? .placeholder : .invalidated)

            if hasError {
                VStack {
                    Text("Could not get \(title) movies")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Button("Try again") {
                        onTryAgain()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 276)
                .padding()
            } else {
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 20) {
                        if isLoading {
                            ForEach(0...10, id: \.self) { _ in
                                MovieSkeletonView()
                            }
                        } else {
                            ForEach(movies) { movie in
                                NavigationLink {
                                    MovieDetailsView(viewModel: MovieDetailsViewModel(selectedMovieId: movie.id))
                                } label: {
                                    MovieView(movie: movie)
                                }
                                .buttonStyle(.plain)
                            }

                            if !movies.isEmpty {
                                VStack {
                                    Spacer()
                                    NavigationLink {
                                        MovieGridView(viewModel: MovieListViewModel(selectedList: selectedList))
                                    } label: {
                                        SeeAllView()
                                    }
                                    .buttonStyle(.plain)

                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
                .allowsHitTesting(!isLoading)
            }
        }
    }
}

#Preview {
    CarouselMovieView(
        title: "Discover",
        isLoading: true,
        hasError: false,
        movies: [],
        selectedList: .nowPlaying,
        onTryAgain: { }
    )
}
