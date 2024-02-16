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

#Preview {
    NowPlayingCarouselView()
}
