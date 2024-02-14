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
        if let score, score < 0.4 {
            return Color(red: 201/255, green: 56/255, blue: 97/255)
        } else if let score, score < 0.7 {
            return Color(red: 190/255, green: 192/255, blue: 76/255)
        } else {
            return Color(red: 99/255, green: 205/255, blue: 130/255)
        }
    }

    private let backgroundColor = Color(red: 13/255, green: 28/255, blue: 33/255)
    private let notRatedRingColor = Color(red: 102/255, green: 102/255, blue: 102/255)

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
                Text(String(Int(score*100)))
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
