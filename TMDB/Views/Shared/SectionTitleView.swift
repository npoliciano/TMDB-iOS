//
//  SectionTitleView.swift
//  TMDB
//
//  Created by Nicolle on 02/03/24.
//

import SwiftUI

struct SectionTitleView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.leading)
    }
}
