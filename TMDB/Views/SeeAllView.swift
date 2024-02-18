//
//  SeeAllView.swift
//  TMDB
//
//  Created by Nicolle on 14/02/24.
//

import SwiftUI

struct SeeAllView: View {
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .foregroundStyle(
                        Colors.accent
                    )
                    .frame(width: 50)
                Image(systemName: "arrow.right")
                    .foregroundStyle(.black)
            }
            Text("See All")
                .frame(width: 100)
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    SeeAllView()
}
