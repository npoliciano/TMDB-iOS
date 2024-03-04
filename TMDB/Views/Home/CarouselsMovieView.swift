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
            isLoading: viewModel.isLoadingNowPlaying,
            hasError: viewModel.hasNowPlayingError,
            movies: viewModel.nowPlayingMovies,
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
            isLoading: viewModel.isLoadingUpcoming,
            hasError: viewModel.hasUpcomingError,
            movies: viewModel.upcomingMovies,
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
            isLoading: viewModel.isLoadingPopular,
            hasError: viewModel.hasPopularError,
            movies: viewModel.popularMovies,
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
            isLoading: viewModel.isLoadingTopRated,
            hasError: viewModel.hasTopRatedError,
            movies: viewModel.topRatedMovies,
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
