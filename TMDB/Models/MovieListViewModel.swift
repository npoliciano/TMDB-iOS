//
//  MovieListViewModel.swift
//  TMDB
//
//  Created by Nicolle on 17/02/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    private let api = MoviesAPI()
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    private let selectedList: String

    init(selectedList: String) {
        self.selectedList = selectedList
    }

    func getUpcomingMovies() {
        isLoading = true

        let url = URL(string: "https://api.themoviedb.org/3/movie/\(selectedList)?language=en-US&page=1")!
        api.getMovies(url: url) { movies in
            self.isLoading = false
            self.movies = movies ?? []
        }
    }
}
