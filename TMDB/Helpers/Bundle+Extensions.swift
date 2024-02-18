//
//  Bundle+Extensions.swift
//  TMDB
//
//  Created by Nicolle on 16/02/24.
//

import Foundation

extension Bundle {
    static var apiKey: String {
        guard let path = Bundle.main.path(forResource: "TMDB_Info", ofType: "plist") else {
            return ""
        }

        let plist = try? NSDictionary(contentsOf: URL(fileURLWithPath: path), error: ())

        return plist?["apiKey"] as? String ?? ""
    }
}
