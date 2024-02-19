//
//  ContentView.swift
//  TMDB
//
//  Created by Nicolle on 07/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView(.vertical) {
                VStack(spacing: 32) {
                    NowPlayingCarouselView(onSeeAllTap: {
                        path.append(SelectedList.nowPlaying)
                    })
                    UpcomingCarouselView(onSeeAllTap: {
                        path.append(SelectedList.upcoming)
                    })
                    PopularCarouselView(onSeeAllTap: {
                        path.append(SelectedList.popular)
                    })
                    TopRatedCarouselView(onSeeAllTap: {
                        path.append(SelectedList.topRated)
                    })
                }
                .padding(.bottom, 16)
            }
            .navigationDestination(for: SelectedList.self, destination: { selectedList in
                MovieGridView(viewModel: MovieListViewModel(selectedList: selectedList))
            })
        }

    }
}

#Preview {
    ContentView()
}
