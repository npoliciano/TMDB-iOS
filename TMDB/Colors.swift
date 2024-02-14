//
//  Colors.swift
//  TMDB
//
//  Created by Nicolle on 14/02/24.
//

import Foundation
import SwiftUI

enum Colors {
    static let accent = LinearGradient(
        colors: [
            Color(red: 191/255, green: 248/255, blue: 206/255),
            Color(red: 104/255, green: 212/255, blue: 173/255),
            Color(red: 113/255, green: 177/255, blue: 212/255),
            Color(red: 79/255, green: 144/255, blue: 233/255)
        ],
        startPoint: .leading,
        endPoint: .trailing
    )
    static let red = Color(red: 201/255, green: 56/255, blue: 97/255)
    static let yellow = Color(red: 190/255, green: 192/255, blue: 76/255)
    static let green = Color(red: 99/255, green: 205/255, blue: 130/255)
    static let darkBlue = Color(red: 13/255, green: 28/255, blue: 33/255)
    static let gray = Color(red: 102/255, green: 102/255, blue: 102/255)
}
