//
//  Functions.swift
//  TMDB
//
//  Created by Nicolle on 03/03/24.
//

import Foundation

func delayOneSecond(action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        action()
    }
}
