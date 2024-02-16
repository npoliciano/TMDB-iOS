//
//  CarouselsView.swift
//  TMDB
//
//  Created by Nicolle on 16/02/24.
//

import SwiftUI

struct NowPlayingCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()
    var body: some View {
        CarouselView(
            title: "Now Playing",
            isLoading: viewModel.isLoadingNowPlaying,
            movies: viewModel.nowPlayingMovies
        )
        .onAppear() {
            viewModel.getNowPlayingMovies()
        }
    }
}

struct UpcomingCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()
    var body: some View {
        CarouselView(
            title: "Upcoming",
            isLoading: viewModel.isLoadingUpcoming,
            movies: viewModel.upcomingMovies
        )
        .onAppear() {
            viewModel.getUpcomingMovies()
        }
    }
}

struct PopularCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()
    var body: some View {
        CarouselView(
            title: "Popular",
            isLoading: viewModel.isLoadingPopular,
            movies: viewModel.popularMovies
        )
        .onAppear() {
            viewModel.getPopularMovies()
        }
    }
}

struct TopRatedCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()
    var body: some View {
        CarouselView(
            title: "Top Rated",
            isLoading: viewModel.isLoadingTopRated,
            movies: viewModel.topRatedMovies
        )
        .onAppear() {
            viewModel.getTopRatedMovies()
        }
    }
}


#Preview {
    NowPlayingCarouselView()
}
