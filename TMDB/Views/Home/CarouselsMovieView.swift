//
//  CarouselsMovieView.swift
//  TMDB
//
//  Created by Nicolle on 16/02/24.
//

import SwiftUI

struct NowPlayingCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()

    var body: some View {
        CarouselMovieView(
            title: "Now Playing",
            state: viewModel.nowPlayingState,
            selectedList: .nowPlaying,
            onTryAgain: {
                viewModel.getNowPlayingMovies()
            }
        )
        .onAppear() {
            viewModel.getNowPlayingMovies()
        }
    }
}

struct UpcomingCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()

    var body: some View {
        CarouselMovieView(
            title: "Upcoming",
            state: viewModel.upcomingState,
            selectedList: .upcoming,
            onTryAgain: {
                viewModel.getUpcomingMovies()
            }
        )
        .onAppear() {
            viewModel.getUpcomingMovies()
        }
    }
}

struct PopularCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()

    var body: some View {
        CarouselMovieView(
            title: "Popular",
            state: viewModel.popularState,
            selectedList: .popular,
            onTryAgain: {
                viewModel.getPopularMovies()
            }
        )
        .onAppear() {
            viewModel.getPopularMovies()
        }
    }
}

struct TopRatedCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()

    var body: some View {
        CarouselMovieView(
            title: "Top Rated",
            state: viewModel.topRatedState,
            selectedList: .topRated,
            onTryAgain: {
                viewModel.getTopRatedMovies()
            }
        )
        .onAppear() {
            viewModel.getTopRatedMovies()
        }
    }
}


#Preview {
    NowPlayingCarouselView()
}
