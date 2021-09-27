//
//  URLRequestBuilder.swift
//  DZ№2
//
//  Created by Egor Malyshev on 25.09.2021.
//

import Foundation

struct URLRequestBuilder {
    
    func makeURLRequest(route: APIRouter) -> URLRequest? {
        let components = makeComponents(route: route)
        guard let url = components.url else {
            return nil
        }
        print(url.absoluteString)
        return URLRequest(url: url)
    }
    
    private func makeComponents(route: APIRouter) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "gateway.marvel.com"
        components.path = route.path
        components.queryItems = makeQueryItems(parameters: route.parameters)
        return components
    }
    
    private func makeQueryItems(parameters: [String:CustomStringConvertible]?) -> [URLQueryItem]? {
        return parameters?.compactMap { URLQueryItem(name: $0.key, value: $0.value.description) }
    }
}
