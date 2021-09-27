//
//  Character.swift
//  DZ№2
//
//  Created by Egor Malyshev on 25.09.2021.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Thumbnail?
}

struct Thumbnail: Codable {
    let path: String?
    let imageExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}
