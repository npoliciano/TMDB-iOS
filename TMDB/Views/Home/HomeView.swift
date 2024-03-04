//
//  HomeView.swift
//  TMDB
//
//  Created by Nicolle on 07/02/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = MoviesViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 32) {
                    NowPlayingCarouselView(viewModel: viewModel)
                    UpcomingCarouselView(viewModel: viewModel)
                    PopularCarouselView(viewModel: viewModel)
                    TopRatedCarouselView(viewModel: viewModel)
                }
                .padding(.bottom, 16)
            }
            .scrollDisabled(viewModel.isScrollDisabled)
            .padding(.top)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image(.tmdbLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(8)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Colors.navigationBar, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }

    }
}

#Preview {
    HomeView()
}
