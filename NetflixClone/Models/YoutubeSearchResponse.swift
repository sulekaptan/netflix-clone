//
//  YoutubeSearchResponse.swift
//  NetflixClone
//
//  Created by Şule Kaptan on 16.03.2024.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
