//
//  ScoreView.swift
//  TMDB
//
//  Created by Nicolle on 13/02/24.
//

import SwiftUI

struct ScoreView: View {
    let score: Double?
    
    var ringColor: Color {
        if let score, score < 4 {
            return Colors.red
        } else if let score, score < 7 {
            return Colors.yellow
        } else {
            return Colors.green
        }
    }

    private let backgroundColor = Colors.darkBlue
    private let notRatedRingColor = Colors.gray

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    score != nil 
                        ? ringColor.opacity(0.5)
                        : notRatedRingColor,
                    lineWidth: 2
                )
            if let score {
                Circle()
                    .trim(from: 0, to: score)
                    .stroke(
                        ringColor,
                        style: StrokeStyle(
                            lineWidth: 2,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                Text(String(Int(score*10)))
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
    "Score View",
    traits: .fixedLayout(width: 100, height: 100)
)
{
    ScoreView(score: nil)
        .padding()
}
