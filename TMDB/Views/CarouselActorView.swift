//
//  CarouselActorView.swift
//  TMDB
//
//  Created by Nicolle on 29/02/24.
//

import SwiftUI

struct CarouselActorView: View {
    let cast: [Actor]

    var body: some View {
        VStack(alignment: .leading) {
            SectionTitleView(title: "Top Billed Cast")

            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(cast) { actor in
                        ActorView(actor: actor)
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CarouselActorView(
        cast: [Actor(
            name: "Emma Stone",
            profileURL: URL(string: "https://image.tmdb.org/t/p/w185//eWjkPYeXxPhE2F9J3Ui6E9OWVXy.jpg")!,
            character: "Bella Baxter"
        ), Actor(
            name: "Emma Stone",
            profileURL: URL(string: "https://image.tmdb.org/t/p/w185//eWjkPYeXxPhE2F9J3Ui6E9OWVXy.jpg")!,
            character: "Bella Baxter"
        ), Actor(
            name: "Emma Stone",
            profileURL: URL(string: "https://image.tmdb.org/t/p/w185//eWjkPYeXxPhE2F9J3Ui6E9OWVXy.jpg")!,
            character: "Bella Baxter"
        )
        ]
    )
}
