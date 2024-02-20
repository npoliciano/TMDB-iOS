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
                    Text(viewModel.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(Colors.accent)
                        .padding([.top, .leading, .trailing])

                    Grid {
                        let columns = columns(for: proxy.size.width)
                        let rows = rows(for: columns)
                        ForEach(0 ..< rows, id: \.self) { row in
                            GridRow {
                                ForEach(0 ..< columns, id: \.self) { column in
                                    let index = row * columns + column
                                    MovieBackdropView(movie: viewModel.movies[index])
                                        .padding()
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
    }
}

#Preview {
    MovieGridView(viewModel: MovieListViewModel(selectedList: .nowPlaying))
}
