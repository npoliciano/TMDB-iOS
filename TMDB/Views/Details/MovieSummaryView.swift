//
//  MovieSummaryView.swift
//  TMDB
//
//  Created by Nicolle on 28/02/24.
//

import SwiftUI
import Kingfisher

struct MovieSummaryView: View {
    let summary: MovieSummary
    let trailerURL: URL?
    @State var isTrailerButtonTapped = false
    @State var backgroundColor = Color(uiColor: .systemBackground)

    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                KFImage(summary.backdropURL)
                    .fade(duration: 0.25)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: 60)
                    .mask(LinearGradient(gradient: Gradient(colors: [.clear, .clear, .black, .black, .black, .black]), startPoint: .leading, endPoint: .trailing))

                KFImage(summary.posterURL)
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
                Text(summary.title)
                    .font(.title)
                    .fontWeight(.medium)

                + Text(" (\(summary.releaseYear))")
                    .font(.title3)
                    .fontWeight(.light)
            }
            .multilineTextAlignment(.center)

            HStack(spacing: 30) {
                ScoreView(size: .regular, score: summary.voteAverage)
                    .offset(x: 15)
                Text("User Score")
                    .font(.headline)
                    .fontWeight(.bold)
                Divider()
                    .frame(height: 30)
                    .overlay(.white)
                Button {
                    isTrailerButtonTapped.toggle()
                } label: {
                    Text("▶︎   Play Trailer")
                        .font(.headline)
                        .opacity(trailerURL == nil ? 0.3 : 1.0)
                }
                .disabled(trailerURL == nil)
            }
            .padding(.vertical, 10)

            VStack {
                Divider()
                    .overlay(.black.opacity(0.6))
                    .padding(.bottom, 6)

                Text(summary.releaseDate)
                + Text(" • \(summary.runtime)")
                Text(summary.genres)

                Divider()
                    .overlay(.black.opacity(0.6))
                    .padding(.top, 6)
            }
            .background(.black.opacity(0.1))

            VStack(alignment: .leading, spacing: 16) {
                if !summary.tagline.isEmpty {
                    Text(summary.tagline)
                        .italic()
                        .font(.headline)
                        .fontWeight(.light)
                }

                Text("Overview")
                    .font(.title2)
                    .fontWeight(.bold)

                Text(summary.overview)
            }
            .padding()
        }
        .padding(.bottom)
        .foregroundStyle(.white)
        .background(backgroundColor)
        .sheet(isPresented: $isTrailerButtonTapped, content: {
            WebView(url: trailerURL!)
        })
    }
}


#Preview {
    MovieSummaryView(
        summary: MovieSummary(
            title: "Dune",
            genres: "Science Fiction",
            backdropURL: URL(string: "https://image.tmdb.org/t/p/w1280//93kdIQDf7Zwp5mzvo6RPa4UbgPW.jpg")!,
            posterURL: URL(string: "https://image.tmdb.org/t/p/w500//c1AiZTXyyzmPOlTLSubp7CEeYj.jpg")!,
            overview:   "Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity's greatest potential-only those who can conquer their fear will survive.",
            releaseDate: "2021-09-15",
            releaseYear: "2021",
            runtime: "155",
            tagline: "It begins.",
            voteAverage: 7.787
        ),
        trailerURL: nil
    )
}
