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
    @State var backgroundColor = Color(uiColor: .systemBackground)

    var body: some View {
        ScrollView {
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
                            .onSuccess({ result in
                                if let predominantColor = result.image.predominantColor() {
                                    backgroundColor = predominantColor
                                }
                            })
                            .scaledToFit()
                            .frame(height: 180)
                            .background(.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()

                    }
                    .frame(height: 240)

                    Group {
                        Text(movieDetails.title)
                            .font(.title)
                            .fontWeight(.medium)

                        + Text(" (\(movieDetails.releaseYear))")
                            .font(.title3)
                            .fontWeight(.light)
                    }
                    .multilineTextAlignment(.center)

                    HStack(spacing: 30) {
                        ScoreView(size: .regular, score: movieDetails.voteAverage)
                            .offset(x: 15)
                        Text("User Score")
                            .font(.headline)
                            .fontWeight(.bold)
                        Divider()
                            .frame(height: 30)
                            .overlay(.white)
                        Text("▶︎   Play Trailer")
                            .font(.headline)
                    }
                    .padding(.vertical, 10)

                    VStack {
                        Divider()
                            .overlay(.black.opacity(0.6))
                            .padding(.bottom, 6)

                        Text(movieDetails.releaseDate)
                        + Text(" • \(movieDetails.runtime)")
                        Text(movieDetails.genres)

                        Divider()
                            .overlay(.black.opacity(0.6))
                            .padding(.top, 6)
                    }
                    .background(.black.opacity(0.1))

                    VStack(alignment: .leading, spacing: 16) {
                        if !movieDetails.tagline.isEmpty {
                            Text(movieDetails.tagline)
                                .italic()
                                .font(.headline)
                                .fontWeight(.light)
                        }

                            Text("Overview")
                                .font(.title2)
                                .fontWeight(.bold)

                            Text(movieDetails.overview)
                    }
                    .padding()

                    Spacer()
                }
            }
        }
        .foregroundStyle(.white)
        .background(backgroundColor)
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
