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
        let trailerURL = URL(string: "https://api.themoviedb.org/3/movie/\(selectedMovieId)/videos?language=en-US")!

        let group = DispatchGroup()

        group.enter()
        var summaryResult: MovieSummary?
        api.getMovieSummary(url: summaryUrl) { movieSummary in
            summaryResult = movieSummary
            group.leave()
        }

        var castResult: [Actor] = []
        group.enter()
        api.getCast(url: creditsUrl) { cast in
            castResult = cast ?? []
            group.leave()
        }

        var urlResult: URL?
        group.enter()
        api.getTrailer(url: trailerURL) { url in
            urlResult = url
            group.leave()
        }

        group.notify(queue: .main) { [weak self] in
            if let summaryResult {
                self?.movieDetails = MovieDetails(
                    summary: summaryResult,
                    cast: castResult,
                    trailerURL: urlResult
                )
            }
        }
    }
}
