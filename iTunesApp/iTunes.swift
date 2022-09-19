//
//  iTune.swift
//  MemeApp
//
//  Created by doriswlc on 2022/9/12.
//

import Foundation

struct SearchResponse: Codable {
    let resultCount: Int
    let results: [StoreItem]
}
struct StoreItem: Codable {
    let trackId: Int
    let artistName: String
    let trackName: String
    let collectionName: String?
    let previewUrl: URL
    let artworkUrl100: URL
    let collectionPrice: Double?
    let releaseDate: Date
    let isStreamable: Bool?
}
