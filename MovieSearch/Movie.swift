//
//  Movie.swift
//  MovieSearch
//
//  Created by William Trahan on 4/5/20.
//  Copyright © 2020 Wil Trahan. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let release_date: String
}

extension Movie {
    static func movies() -> [Movie] {
        guard
            let url = Bundle.main.url(forResource: "movies", withExtension: "json"),
            let data = try? Data(contentsOf: url)
            else {
                return []
            }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Movie].self, from: data)
        } catch {
            return []
        }
    }
}
