//
//  MovieListViewModel.swift
//  TMDB
//
//  Created by Nicolle on 17/02/24.
//

import Foundation

enum MovieListState {
    case loading
    case error
    case content([Movie])
}

enum SelectedList: String {
    case popular
    case upcoming
    case nowPlaying = "now_playing"
    case topRated = "top_rated"

    var viewTitle: String {
        switch self {
        case .popular:
            "Popular"
        case .upcoming:
            "Upcoming"
        case .nowPlaying:
            "Now Playing"
        case .topRated:
            "Top Rated"
        }
    }
}

class MovieListViewModel: ObservableObject {
    @Published var state = MovieListState.loading

    private let api = MoviesAPI()
    private let selectedList: SelectedList
    
    var title: String {
        selectedList.viewTitle
    }

    init(selectedList: SelectedList) {
        self.selectedList = selectedList
    }

    func getMovies() {
        state = .loading

        let url = URL(string: "https://api.themoviedb.org/3/movie/\(selectedList.rawValue)?language=en-US&page=1")!
        api.getMovies(url: url) { [weak self] movies in
            if let movies {
                self?.state = .content(movies)
            } else {
                delayOneSecond {
                    self?.state = .error
                }
            }
        }
    }
}
