//
//  MoviesViewModel.swift
//  TMDB
//
//  Created by Nicolle on 15/02/24.
//

import Foundation

typealias SectionState = ViewState<[Movie]>

class MoviesViewModel: ObservableObject {
    let api = MoviesAPI()
    @Published var upcomingState = SectionState.loading
    @Published var nowPlayingState = SectionState.loading
    @Published var popularState = SectionState.loading
    @Published var topRatedState = SectionState.loading

    var isScrollDisabled: Bool {
        upcomingState.isLoading && nowPlayingState.isLoading && popularState.isLoading && topRatedState.isLoading
    }

    func getUpcomingMovies() {
        upcomingState = .loading

        api.getMovies(for: .upcoming) { [weak self] movies in
            if let movies {
                self?.upcomingState = .content(movies)
            } else {
                delayOneSecond {
                    self?.upcomingState = .error
                }
            }
        }
    }

    func getNowPlayingMovies() {
        nowPlayingState = .loading

        api.getMovies(for: .nowPlaying) { [weak self] movies in
            if let movies {
                self?.nowPlayingState = .content(movies)
            } else {
                delayOneSecond {
                    self?.nowPlayingState = .error
                }
            }
        }
    }

    func getPopularMovies() {
        popularState = .loading

        api.getMovies(for: .popular) { [weak self] movies in
            if let movies {
                self?.popularState = .content(movies)
            } else {
                delayOneSecond {
                    self?.popularState = .error
                }
            }
        }
    }

    func getTopRatedMovies() {
        topRatedState = .loading

        api.getMovies(for: .topRated) { [weak self] movies in
            if let movies {
                self?.topRatedState = .content(movies)
            } else {
                delayOneSecond {
                    self?.topRatedState = .error
                }
            }
        }
    }
}
