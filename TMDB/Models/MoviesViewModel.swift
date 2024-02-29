//
//  MoviesViewModel.swift
//  TMDB
//
//  Created by Nicolle on 15/02/24.
//

import Foundation

class MoviesViewModel: ObservableObject {
    let api = MoviesAPI()
    @Published var nowPlayingMovies: [Movie] = []
    @Published var isLoadingNowPlaying = false

    @Published var upcomingMovies: [Movie] = []
    @Published var isLoadingUpcoming = false

    @Published var popularMovies: [Movie] = []
    @Published var isLoadingPopular = false

    @Published var topRatedMovies: [Movie] = []
    @Published var isLoadingTopRated = false

    func getUpcomingMovies() {
        isLoadingUpcoming = true

        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1")!
        api.getMovies(url: url) { [weak self] movies in
            self?.isLoadingUpcoming = false
            self?.upcomingMovies = movies ?? []
        }
    }

    func getNowPlayingMovies() {
        isLoadingNowPlaying = true
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!

        api.getMovies(url: url) { [weak self] movies in
            self?.isLoadingNowPlaying = false
            self?.nowPlayingMovies = movies ?? []
        }
    }

    func getPopularMovies() {
        isLoadingPopular = true
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")!

        api.getMovies(url: url) { [weak self] movies in
            self?.isLoadingPopular = false
            self?.popularMovies = movies ?? []
        }
    }

    func getTopRatedMovies() {
        isLoadingTopRated = true
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")!

        api.getMovies(url: url) { [weak self] movies in
            self?.isLoadingTopRated = false
            self?.topRatedMovies = movies ?? []
        }
    }
}
