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
        }

    }
}

#Preview {
    ContentView()
}
