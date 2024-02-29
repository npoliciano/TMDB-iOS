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

        let summaryUrl = URL(string: "https://api.themoviedb.org/3/movie/\(selectedMovieId)?language=en-US")!
        let creditsUrl = URL(string: "https://api.themoviedb.org/3/movie/\(selectedMovieId)/credits?language=en-US")!
        
        api.getMovieSummary(url: summaryUrl) { [weak self] movieSummary in
            guard let movieSummary else {
                return
            }

            self?.api.getCast(url: creditsUrl) { [weak self] cast in
                self?.movieDetails = MovieDetails(summary: movieSummary, cast: cast ?? [])
            }
        }
    }
}
