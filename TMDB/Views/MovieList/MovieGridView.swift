//
//  MovieGridView.swift
//  TMDB
//
//  Created by Nicolle on 18/02/24.
//

import SwiftUI

struct MovieGridView: View {
    @ObservedObject var viewModel: MovieListViewModel
    private let minimumCellWidth = 300.0

    func columns(for screenWidth: CGFloat) -> Int {
        Int(screenWidth / minimumCellWidth)
    }

    func rows(for columns: Int, for movies: [Movie]) -> Int {
        guard columns > 0 else {
            return 0
        }
        return Int(ceil(Double(movies.count) / Double(columns)))
    }

    private var isLoading: Bool {
        if case .loading = viewModel.state {
            return true
        }
        return false
    }

    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    SectionTitleView(title: viewModel.title)
                        .padding([.top, .trailing])
                        .redacted(reason: isLoading ? .placeholder : .invalidated)
                    switch viewModel.state {
                    case .loading:
                        Grid {
                            MovieGridSkeletonView(columns: columns(for: proxy.size.width))
                        }
                    case .error:
                        ErrorView(
                            message: "Could not get the \(viewModel.title) movies.",
                            onTryAgain: {
                                viewModel.getMovies()
                            }
                        )
                        .frame(maxWidth: .infinity)
                        .frame(height: 276)
                        .padding()
                    case .content(let movies):
                        Grid {
                            let columns = columns(for: proxy.size.width)
                            let rows = rows(for: columns, for: movies)

                            ForEach(0 ..< rows, id: \.self) { row in
                                GridRow {
                                    ForEach(0 ..< columns, id: \.self) { column in
                                        let index = row * columns + column
                                        if index < movies.count {
                                            NavigationLink {
                                                MovieDetailsView(viewModel: MovieDetailsViewModel(selectedMovieId: movies[index].id))
                                            } label: {
                                                MovieBackdropView(movie: movies[index])
                                                    .padding()
                                            }
                                            .buttonStyle(.plain)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.getMovies()
            }
        }
        .allowsHitTesting(!isLoading)
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
    }
}

#Preview {
    MovieGridView(viewModel: MovieListViewModel(selectedList: .nowPlaying))
}
