//
//  ScoreView.swift
//  TMDB
//
//  Created by Nicolle on 13/02/24.
//

import SwiftUI

struct ScoreView: View {
    let progress: Double?
    private let ringColor = Color(red: 99/255, green: 205/255, blue: 130/255)
    private let backgroundColor = Color(red: 13/255, green: 28/255, blue: 33/255)
    private let notRatedRingColor = Color(red: 102/255, green: 102/255, blue: 102/255)

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    progress != nil 
                        ? ringColor.opacity(0.5)
                        : notRatedRingColor,
                    lineWidth: 2
                )
            if let progress {
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
            } else {
                Text("NR")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
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
    ScoreView(progress: nil)
        .padding()
}
