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

    func columns(for screenWidth: CGFloat) -> [GridItem] {
        let count = Int(screenWidth / minimumCellWidth)
        return Array(
            repeating: GridItem(.flexible(), spacing: 16, alignment: .top),
            count: count
        )
    }

    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 48) {
                    Text(viewModel.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(Colors.accent)

                    LazyVGrid(columns: columns(for: proxy.size.width), spacing: 32) {
                        ForEach(viewModel.movies) { movie in
                            MovieBackdropView(movie: movie)
                        }
                    }
                }
                .padding()

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
