//
//  ViewState.swift
//  TMDB
//
//  Created by Nicolle on 04/03/24.
//

import Foundation

enum ViewState<T> {
    case loading
    case error
    case content(T)

    var isLoading: Bool {
        if case .loading = self {
            return true
        }
        return false
    }
}
