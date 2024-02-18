//
//  MovieGridView.swift
//  TMDB
//
//  Created by Nicolle on 18/02/24.
//

import SwiftUI

struct MovieGridView: View {
    @ObservedObject var viewModel: MovieListViewModel

    func columns(for screenWidth: CGFloat) -> [GridItem] {
        let minimumCellWidth = 300.0
        let count = Int(screenWidth / minimumCellWidth)
        return Array(
            repeating: GridItem(.flexible(), spacing: 16, alignment: .top),
            count: count
        )
    }

    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(columns: columns(for: proxy.size.width), spacing: 32) {
                    ForEach(viewModel.movies) { movie in
                        MovieBackdropView(movie: movie)
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
    MovieGridView(viewModel: MovieListViewModel(selectedList: "popular"))
}
