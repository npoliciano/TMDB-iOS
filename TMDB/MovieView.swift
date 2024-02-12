//
//  MovieView.swift
//  TMDB
//
//  Created by Nicolle on 12/02/24.
//

import SwiftUI

struct MovieView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("dune-backdrop")
                .resizable()
                .scaledToFill()

            VStack(alignment: .leading) {
                Text("They Shot the Piano Player")
                    .font(.system(size: 8))
                    .fontWeight(.heavy)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Jul 26, 2024")
                    .font(.system(size: 8))
                    .foregroundStyle(.black .opacity(0.7))
            }
            .padding(4)
        }
        .clipShape(RoundedRectangle(cornerRadius: 3))
        .background(
            RoundedRectangle(cornerRadius: 3)
                .stroke(.gray,lineWidth: 0.2)
        )
    }
}

#Preview(
    "Movie View",
    traits: .fixedLayout(width: 110, height: 200)
) {
    MovieView()
        .padding(8)
}

