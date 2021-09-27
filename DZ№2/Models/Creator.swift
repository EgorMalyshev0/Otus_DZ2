//
//  Creator.swift
//  DZ№2
//
//  Created by Egor Malyshev on 27.09.2021.
//

import Foundation

struct Creator: Codable, Identifiable {
    let id: Int?
    let fullName: String?
    let thumbnail: Thumbnail?
    let stories: StoryList?
}

struct StoryList: Codable {
    let items: [StorySummary]?
}

struct StorySummary: Codable, Identifiable {
    let id: Int?
    let name: String?
}
