//
//  NetworkService.swift
//  DZ№2
//
//  Created by Egor Malyshev on 25.09.2021.
//

import Foundation
import SwiftUI

class NetworkService {
    
    var session: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        self.session = URLSession(configuration: config)
    }
    
    func performRequest<T: Codable>(route: APIRouter, completion: @escaping (Result<T, Error>) -> Void) {
        guard let request = route.request else { return }
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        .resume()
    }
}
