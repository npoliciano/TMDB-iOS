//
//  CarouselMovieView.swift
//  TMDB
//
//  Created by Nicolle on 14/02/24.
//

import SwiftUI

struct CarouselMovieView: View {
    let title: String
    let state: SectionState
    let selectedList: SelectedList
    let onTryAgain: () -> Void

    private var isLoading: Bool {
        if case .loading = state {
            return true
        }
        return false
    }

    var body: some View {
        VStack(alignment: .leading) {
            SectionTitleView(title: title)
                .redacted(reason: isLoading ? .placeholder : .invalidated)

            switch state {
            case .loading:
                ForEach(0...10, id: \.self) { _ in
                    MovieSkeletonView()
                }
            case .error:
                ErrorView(
                    message: "Could not get \(title) movies",
                    onTryAgain: onTryAgain
                )
                .frame(maxWidth: .infinity)
                .frame(height: 276)
                .padding()
            case .content(let movies):
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 20) {

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
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    CarouselMovieView(
        title: "Discover",
        state: .loading,
        selectedList: .nowPlaying,
        onTryAgain: { }
    )
}
