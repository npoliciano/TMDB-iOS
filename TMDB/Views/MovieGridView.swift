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

    func rows(for columns: Int) -> Int {
        guard columns > 0 else {
            return 0
        }
        return Int(ceil(Double(viewModel.movies.count) / Double(columns)))
    }

    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    SectionTitleView(title: viewModel.title)
                        .padding([.top, .trailing])
                        .redacted(reason: viewModel.isLoading ? .placeholder : .invalidated)

                    Grid {
                        if viewModel.isLoading {
                            MovieGridSkeletonView(columns: columns(for: proxy.size.width))
                        } else {
                            let columns = columns(for: proxy.size.width)
                            let rows = rows(for: columns)

                            ForEach(0 ..< rows, id: \.self) { row in
                                GridRow {
                                    ForEach(0 ..< columns, id: \.self) { column in
                                        let index = row * columns + column
                                        if index < viewModel.movies.count {
                                            NavigationLink {
                                                MovieDetailsView(viewModel: MovieDetailsViewModel(selectedMovieId: viewModel.movies[index].id))
                                            } label: {
                                                MovieBackdropView(movie: viewModel.movies[index])
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
        .allowsHitTesting(!viewModel.isLoading)
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
