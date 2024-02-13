//
//  ScoreView.swift
//  TMDB
//
//  Created by Nicolle on 13/02/24.
//

import SwiftUI

struct ScoreView: View {
    let progress: Double
    let ringColor = Color(red: 99/255, green: 205/255, blue: 130/255)
    let backgroundColor = Color(red: 13/255, green: 28/255, blue: 33/255)

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    ringColor.opacity(0.5),
                    lineWidth: 2
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    ringColor,
                    style: StrokeStyle(
                        lineWidth: 2,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
            Text(String(Int(progress*100)))
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            + Text("%")
                .font(.system(size: 5))
                .foregroundStyle(.white)
                .baselineOffset(6.0)
        }
        .frame(width: 30, height: 30)
        .background(
            Circle()
                .stroke(
                    backgroundColor,
                    lineWidth: 5
                )
                .fill(backgroundColor)
        )
    }
}

#Preview (
    "Movie View",
    traits: .fixedLayout(width: 100, height: 100)
)
{
    ScoreView(progress: 1)
        .padding()
}
