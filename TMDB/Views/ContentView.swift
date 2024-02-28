//
//  ContentView.swift
//  TMDB
//
//  Created by Nicolle on 07/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 32) {
                    NowPlayingCarouselView()
                    UpcomingCarouselView()
                    PopularCarouselView()
                    TopRatedCarouselView()
                }
                .padding(.bottom, 16)
            }
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
    ContentView()
}
