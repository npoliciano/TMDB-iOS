//
//  MovieSkeletonView.swift
//  TMDB
//
//  Created by Nicolle on 16/02/24.
//

import SwiftUI

struct MovieSkeletonView: View {
    var body: some View {
        VStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.3))
                .frame(height: 240)
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.3))
                    .frame(height: 16)
                    .padding(.trailing, 16)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.3))
                    .frame(height: 10)
                    .padding(.trailing, 52)
            }
        }.frame(width: 160)
    }
}

#Preview {
    MovieSkeletonView()
}
