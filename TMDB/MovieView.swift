//
//  MovieView.swift
//  TMDB
//
//  Created by Nicolle on 12/02/24.
//

import SwiftUI

struct MovieView: View {
    var body: some View {
        VStack(spacing: 24) {
            Image("dune-backdrop")
                .resizable()
                .scaledToFit()
                .padding(.top, 0.4)
                .padding(.horizontal, 0.4)
                .clipShape(
                    .rect(
                        topLeadingRadius: 4,
                        topTrailingRadius: 4
                    )
                )

            VStack(alignment: .leading) {
                Text("They Shot the Piano Player")
                    .font(.caption)
                    .fontWeight(.heavy)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Jul 26, 2024")
                    .font(.caption)
                    .foregroundStyle(.primary.opacity(0.7))
            }
            .padding(8)
        }
        .frame(width: 160)
        .clipShape(RoundedRectangle(cornerRadius: 10))

        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5), lineWidth: 0.5)
        )
    }
}

#Preview(
    "Movie View",
    traits: .sizeThatFitsLayout
) {
    MovieView()
        .padding(8)
}

