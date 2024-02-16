//
//  ContentView.swift
//  TMDB
//
//  Created by Nicolle on 07/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 32) {
                CarouselView(title: "Discover")
                CarouselView(title: "Upcoming")
                CarouselView(title: "Featured")
            }
        }
    }
}

#Preview {
    ContentView()
}
