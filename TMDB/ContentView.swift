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
                MovieView()
                MovieView()
                MovieView()
                MovieView()
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
