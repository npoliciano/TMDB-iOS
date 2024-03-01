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
            movies: viewModel.nowPlayingMovies, 
            selectedList: .nowPlaying
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
            movies: viewModel.upcomingMovies, 
            selectedList: .upcoming
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
            movies: viewModel.popularMovies, 
            selectedList: .popular
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
            movies: viewModel.topRatedMovies, 
            selectedList: .topRated
        )
        .onAppear() {
            viewModel.getTopRatedMovies()
        }
    }
}


#Preview {
    NowPlayingCarouselView()
}
