//
//  MovieDetailsViewModel.swift
//  TMDB
//
//  Created by Nicolle on 26/02/24.
//

import Foundation

typealias MovieDetailsState = ViewState<MovieDetails>

class MovieDetailsViewModel: ObservableObject {
    private let selectedMovieId: Int
    private let api = MoviesAPI()
    @Published var state = MovieDetailsState.loading

    init(selectedMovieId: Int) {
        self.selectedMovieId = selectedMovieId
    }

    func getMovieDetails() {
        state = .loading

        let group = DispatchGroup()

        group.enter()
        var summaryResult: MovieSummary?
        api.getMovieSummary(for: selectedMovieId) { movieSummary in
            summaryResult = movieSummary
            group.leave()
        }

        var castResult: [Actor] = []
        group.enter()
        api.getCast(for: selectedMovieId) { cast in
            castResult = cast ?? []
            group.leave()
        }

        var urlResult: URL?
        group.enter()
        api.getTrailer(for: selectedMovieId) { url in
            urlResult = url
            group.leave()
        }

        group.notify(queue: .main) { [weak self] in
            if let summaryResult {
                self?.state = .content(MovieDetails(
                    summary: summaryResult,
                    cast: castResult,
                    trailerURL: urlResult
                ))
            } else {
                delayOneSecond {
                    self?.state = .error
                }
            }
        }
    }
}
