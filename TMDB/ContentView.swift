//
//  ContentView.swift
//  TMDB
//
//  Created by Nicolle on 07/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                MovieView(title: "Dune Part II", score: 0.5, releaseDate: "Feb 09, 2024")
                MovieView(title: "Dune Part II", score: 0.8, releaseDate: "Feb 09, 2024")
                MovieView(title: "Dune Part II", score: nil, releaseDate: "Feb 09, 2024")
                MovieView(title: "Dune Part II", score: 0.2, releaseDate: "Feb 09, 2024")
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
