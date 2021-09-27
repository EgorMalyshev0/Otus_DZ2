//
//  ApiRouter.swift
//  DZ№2
//
//  Created by Egor Malyshev on 25.09.2021.
//

import Foundation

protocol APIRouter {
        
    var parameters: [String: CustomStringConvertible]? { get }
        
    var path: String { get }
    
}

extension APIRouter {
    
    var request: URLRequest? {
        let request = URLRequestBuilder().makeURLRequest(route: self)
        return request
    }
}
