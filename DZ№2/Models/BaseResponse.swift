//
//  BaseResponse.swift
//  DZ№2
//
//  Created by Egor Malyshev on 25.09.2021.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let code: Int
    let status: String
    let copyright: String
    let data: ContentList<T>
}

struct ContentList<T: Codable>: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [T]
}
