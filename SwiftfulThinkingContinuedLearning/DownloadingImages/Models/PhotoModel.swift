//
//  PhotoModel.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/10/04.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
    let albumID: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailUrl = "thumbnailUrl"
    }
}
