//
//  ScoreView.swift
//  TMDB
//
//  Created by Nicolle on 13/02/24.
//

import SwiftUI

enum ScoreViewSize {
    case compact
    case regular
}

struct ScoreView: View {
    let size: ScoreViewSize
    let score: Double
    
    var ringColor: Color {
        if score < 4 {
            return Colors.red
        } else if score < 7 {
            return Colors.yellow
        } else {
            return Colors.green
        }
    }

    private let backgroundColor = Colors.darkBlue
    private let notRatedRingColor = Colors.gray
    private var dimension: CGFloat {
        size == .compact ? 30 : 40
    }
    private var scoreFont: Font {
        size == .compact ? .caption : .body
    }
    private var percentFontSize: CGFloat {
        size == .compact ? 5 : 8
    }
    private var borderWidth: CGFloat {
        size == .compact ? 5 : 7
    }
    private var ringWidth: CGFloat {
        size == .compact ? 2 : 3
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    score != 0
                        ? ringColor.opacity(0.5)
                        : notRatedRingColor,
                    lineWidth: ringWidth
                )
            if score != 0 {
                Circle()
                    .trim(from: 0, to: score/10)
                    .stroke(
                        ringColor,
                        style: StrokeStyle(
                            lineWidth: ringWidth,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                Text(String(Int(score*10)))
                    .font(scoreFont)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                + Text("%")
                    .font(.system(size: percentFontSize))
                    .foregroundStyle(.white)
                    .baselineOffset(6.0)
            } else {
                Text("NR")
                    .font(scoreFont)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
        }
        .frame(
            width: dimension,
            height: dimension
        )
        .background(
            Circle()
                .stroke(
                    backgroundColor,
                    lineWidth: borderWidth
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
    ScoreView(size: .regular, score: 7)
        .padding()
}
