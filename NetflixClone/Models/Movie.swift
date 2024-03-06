//
//  Movie.swift
//  NetflixClone
//
//  Created by Şule Kaptan on 6.03.2024.
//

import Foundation

struct TrendingMoviesResponse: Codable {
    let results : [Movie]
}

struct Movie: Codable {
    let id: Int
    let media_type: String?
    let original_language: String?
    let original_title: String?
    let original_name: String?
    let poster_path: String?
    let release_date: String?
    let overview: String?
    let vote_count: Int
    let vote_average: Double
}
