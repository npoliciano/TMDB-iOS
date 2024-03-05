//
//  MovieListViewModel.swift
//  TMDB
//
//  Created by Nicolle on 17/02/24.
//

import Foundation

typealias MovieListState = ViewState<[Movie]>

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

        api.getMovies(for: selectedList) { [weak self] movies in
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
