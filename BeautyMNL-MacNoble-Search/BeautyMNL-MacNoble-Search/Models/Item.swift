//
//  Item.swift
//  BeautyMNL-MacNoble-Search
//
//  Created by Mac Romel D. Noble on 8/1/22.
//

import Foundation

struct SearchResult: Codable {
    let results: [Item]
}

struct Item: Codable {
    let trackName: String
    let trackPrice: Double?
    let artworkUrl60: URL?
    let artworkUrl100: URL?
    let primaryGenreName: String?
    let releaseDate: String
    let trackTimeMillis: Int?
    let longDescription: String?
    let previewUrl: URL?
}
