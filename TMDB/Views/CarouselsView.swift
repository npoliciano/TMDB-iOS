//
//  CarouselsView.swift
//  TMDB
//
//  Created by Nicolle on 16/02/24.
//

import SwiftUI

struct NowPlayingCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()
    let onSeeAllTap: () -> Void

    var body: some View {
        CarouselView(
            title: "Now Playing",
            isLoading: viewModel.isLoadingNowPlaying,
            movies: viewModel.nowPlayingMovies, 
            onSeeAllTap: {
                onSeeAllTap()
            }
        )
        .onAppear() {
            viewModel.getNowPlayingMovies()
        }
    }
}

struct UpcomingCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()
    let onSeeAllTap: () -> Void

    var body: some View {
        CarouselView(
            title: "Upcoming",
            isLoading: viewModel.isLoadingUpcoming,
            movies: viewModel.upcomingMovies, 
            onSeeAllTap: {
                onSeeAllTap()
            }
        )
        .onAppear() {
            viewModel.getUpcomingMovies()
        }
    }
}

struct PopularCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()
    let onSeeAllTap: () -> Void

    var body: some View {
        CarouselView(
            title: "Popular",
            isLoading: viewModel.isLoadingPopular,
            movies: viewModel.popularMovies, 
            onSeeAllTap: {
                onSeeAllTap()
            }
        )
        .onAppear() {
            viewModel.getPopularMovies()
        }
    }
}

struct TopRatedCarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()
    let onSeeAllTap: () -> Void

    var body: some View {
        CarouselView(
            title: "Top Rated",
            isLoading: viewModel.isLoadingTopRated,
            movies: viewModel.topRatedMovies, 
            onSeeAllTap: {
                onSeeAllTap()
            }
        )
        .onAppear() {
            viewModel.getTopRatedMovies()
        }
    }
}


#Preview {
    NowPlayingCarouselView(onSeeAllTap: {})
}
