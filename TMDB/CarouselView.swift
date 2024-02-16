//
//  CarouselView.swift
//  TMDB
//
//  Created by Nicolle on 14/02/24.
//

import SwiftUI

struct CarouselView: View {
    let title: String
    let isLoading: Bool
    let movies: [Movie]

    var body: some View {
        VStack(alignment: .leading) {
            if isLoading {
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
                    if isLoading {
                        ForEach(0...10, id: \.self) { _ in
                            MovieSkeletonView()
                        }
                    } else {
                        ForEach(movies) { movie in
                            MovieView(movie: movie)
                        }
                        if !movies.isEmpty {
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
            .allowsHitTesting(!isLoading)
        }
    }
}

#Preview {
    CarouselView(
        title: "Discover", isLoading: true, movies: []
    )
}
