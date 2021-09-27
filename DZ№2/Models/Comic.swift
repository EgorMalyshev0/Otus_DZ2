//
//  Comic.swift
//  DZ№2
//
//  Created by Egor Malyshev on 26.09.2021.
//

import Foundation

struct Comic: Codable, Identifiable {
    let id: Int
    let title: String
    let thumbnail: Thumbnail?
}
