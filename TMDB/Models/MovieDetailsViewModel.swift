//
//  MovieDetailsViewModel.swift
//  TMDB
//
//  Created by Nicolle on 26/02/24.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    private let selectedMovie: Movie
    private let api = MoviesAPI()
    @Published var movieDetails: MovieDetails?
    @Published var isLoading = false

    init(selectedMovie: Movie) {
        self.selectedMovie = selectedMovie
    }

    func getMovieDetails() {
        isLoading = true

        let url = URL(string: "https://api.themoviedb.org/3/movie/\(selectedMovie.id)?language=en-US")!
        api.getMovieDetails(url: url) { movieDetails in
            self.isLoading = false
            self.movieDetails = movieDetails
        }
    }
}
