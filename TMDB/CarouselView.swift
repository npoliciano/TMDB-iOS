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
            if viewModel.isLoading {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.3))
                    .frame(width: 200,height: 20)
                    .padding(.leading)
                    .padding(.bottom, 10)
            } else {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading)
            }

            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 20) {
                    if viewModel.isLoading {
                        ForEach(0...10, id: \.self) { _ in
                            MovieSkeletonView()
                        }
                    } else {
                        ForEach(viewModel.movies) { movie in
                            MovieView(movie: movie)
                        }
                        if !viewModel.movies.isEmpty {
                            VStack {
                                Spacer()
                                SeeAllView()
                                Spacer()
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
            .allowsHitTesting(!viewModel.isLoading)
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
