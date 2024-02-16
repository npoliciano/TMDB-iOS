//
//  CarouselView.swift
//  TMDB
//
//  Created by Nicolle on 14/02/24.
//

import SwiftUI

struct CarouselView: View {
    @ObservedObject var viewModel = MoviesViewModel()
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.movies) { movie in
                        MovieView(movie: movie)
                    }
                    SeeAllView()
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
        .onAppear() {
            viewModel.getMovies()
        }
    }
}

#Preview {
    CarouselView(
        title: "Discover"
    )
}
