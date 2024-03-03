//
//  ActorView.swift
//  TMDB
//
//  Created by Nicolle on 29/02/24.
//

import SwiftUI
import Kingfisher

struct ActorView: View {
    let actor: Actor

    var body: some View {
        VStack(spacing: 16) {
            KFImage(actor.profileURL)
                .fade(duration: 0.25)
                .resizable()
                .scaledToFit()
                .frame(height: 240)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading) {
                Text(actor.name)
                    .font(.callout)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(actor.character)
                    .font(.caption)
                    .foregroundStyle(.primary.opacity(0.8))
            }
            .padding(.leading, 12)
            .padding([.vertical, .trailing], 2)
        }
        .frame(width: 160)
    }
}


#Preview {
    ActorView(actor: Actor(name: "Emma Stone", profileURL: URL(string: "https://image.tmdb.org/t/p/w185//eWjkPYeXxPhE2F9J3Ui6E9OWVXy.jpg")!, character: "Bella Baxter"))
}
