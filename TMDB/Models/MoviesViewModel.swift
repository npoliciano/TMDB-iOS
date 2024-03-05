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

        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1")!
        api.getMovies(url: url) { [weak self] movies in
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

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!
        api.getMovies(url: url) { [weak self] movies in
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

        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")!
        api.getMovies(url: url) { [weak self] movies in
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

        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")!
        api.getMovies(url: url) { [weak self] movies in
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
