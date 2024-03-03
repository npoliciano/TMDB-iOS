//
//  MovieSkeletonView.swift
//  TMDB
//
//  Created by Nicolle on 16/02/24.
//

import SwiftUI

struct MovieSkeletonView: View {
    var body: some View {
        MovieView(
            movie: .dummy,
            isLoading: true
        )
    }
}

#Preview {
    MovieSkeletonView()
}
