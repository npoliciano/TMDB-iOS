//
//  MovieDetailsViewModel.swift
//  TMDB
//
//  Created by Nicolle on 26/02/24.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    private let selectedMovieId: Int
    private let api = MoviesAPI()
    @Published var movieDetails: MovieDetails?
    @Published var isLoading = false

    init(selectedMovieId: Int) {
        self.selectedMovieId = selectedMovieId
    }

    func getMovieDetails() {
        isLoading = true

        let url = URL(string: "https://api.themoviedb.org/3/movie/\(selectedMovieId)?language=en-US")!
        api.getMovieDetails(url: url) { movieDetails in
            self.isLoading = false
            self.movieDetails = movieDetails
        }
    }
}
