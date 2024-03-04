//
//  MoviesViewModel.swift
//  TMDB
//
//  Created by Nicolle on 15/02/24.
//

import Foundation

class MoviesViewModel: ObservableObject {
    let api = MoviesAPI()
    @Published var upcomingMovies: [Movie] = []
    @Published var isLoadingUpcoming = false
    @Published var hasUpcomingError = false

    @Published var nowPlayingMovies: [Movie] = []
    @Published var isLoadingNowPlaying = false
    @Published var hasNowPlayingError = false

    @Published var popularMovies: [Movie] = []
    @Published var isLoadingPopular = false
    @Published var hasPopularError = false

    @Published var topRatedMovies: [Movie] = []
    @Published var isLoadingTopRated = false
    @Published var hasTopRatedError = false

    func getUpcomingMovies() {
        isLoadingUpcoming = true
        hasUpcomingError = false

        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1")!
        api.getMovies(url: url) { [weak self] movies in
            if let movies {
                self?.isLoadingUpcoming = false
                self?.upcomingMovies = movies
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                    self?.isLoadingUpcoming = false
                    self?.hasUpcomingError = true
                }
            }
        }
    }

    func getNowPlayingMovies() {
        isLoadingNowPlaying = true
        hasNowPlayingError = false

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!
        api.getMovies(url: url) { [weak self] movies in
            self?.isLoadingNowPlaying = false

            if let movies {
                self?.nowPlayingMovies = movies
            } else {
                self?.hasNowPlayingError = true
            }
        }
    }

    func getPopularMovies() {
        isLoadingPopular = true
        hasPopularError = false

        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")!
        api.getMovies(url: url) { [weak self] movies in
            self?.isLoadingPopular = false

            if let movies {
                self?.popularMovies = movies
            } else {
                self?.hasPopularError = true
            }
        }
    }

    func getTopRatedMovies() {
        isLoadingTopRated = true
        hasTopRatedError = false

        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")!
        api.getMovies(url: url) { [weak self] movies in
            self?.isLoadingTopRated = false

            if let movies {
                self?.topRatedMovies = movies
            } else {
                self?.hasTopRatedError = true
            }
        }
    }
}
