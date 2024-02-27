//
//  MovieDetailsView.swift
//  TMDB
//
//  Created by Nicolle on 26/02/24.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel

    var body: some View {
        VStack {
            if let movieDetails = viewModel.movieDetails {
                ZStack(alignment: .leading) {
                    KFImage(movieDetails.backdropURL)
                        .fade(duration: 0.25)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(x: 60)
                        .mask(LinearGradient(gradient: Gradient(colors: [.clear, .clear, .black, .black, .black, .black]), startPoint: .leading, endPoint: .trailing))

                    KFImage(movieDetails.posterURL)
                        .fade(duration: 0.25)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 180)
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()

                }
                .frame(height: 240)

                Text(movieDetails.title)
                    .font(.title2)
                    .fontWeight(.medium)
                + Text(" (\(movieDetails.releaseYear))")
                    .font(.headline)
                    .fontWeight(.light)

                Spacer()
            }
        }
        .foregroundStyle(.white)
        .background(
            Color(red: 104/255, green: 136/255, blue: 137/255)
        )
        .onAppear {
            viewModel.getMovieDetails()
        }
    }
}

#Preview {
    MovieDetailsView(
        viewModel: MovieDetailsViewModel(selectedMovieId: 438631)
    )
}
