//
//  ErrorView.swift
//  TMDB
//
//  Created by Nicolle on 03/03/24.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let onTryAgain: () -> Void

    var body: some View {
        VStack {
            Text(message)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Button("Try again") {
                onTryAgain()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
