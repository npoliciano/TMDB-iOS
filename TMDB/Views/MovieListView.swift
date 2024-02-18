//
//  MovieListView.swift
//  TMDB
//
//  Created by Nicolle on 17/02/24.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.movies) { movie in
                    MovieBackdropView(movie: movie)
                        .padding()
                }
            }
        }
        .onAppear {
            viewModel.getMovies()
        }
    }
}

#Preview {
    MovieListView(viewModel: MovieListViewModel(selectedList: "upcoming"))
}
