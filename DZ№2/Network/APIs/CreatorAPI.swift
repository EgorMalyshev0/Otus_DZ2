//
//  StoriesAPI.swift
//  DZ№2
//
//  Created by Egor Malyshev on 27.09.2021.
//

import Foundation

class CreatorApi {
    class func getCreators(request: CreatorsRequest, completion: @escaping (BaseResponse<Creator>?) -> Void) {
        let route = CreatorRouter.creators(request)
        NetworkService().performRequest(route: route) { (result: Result<BaseResponse<Creator>, Error>) in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    class func getComics(byCharacterId id: Int, completion: @escaping (BaseResponse<Comic>?) -> Void) {
        let route = CharacterRouter.characterComics(id)
        NetworkService().performRequest(route: route) { (result: Result<BaseResponse<Comic>, Error>) in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}

enum CreatorRouter: APIRouter {
    
    case creators(CreatorsRequest), characterComics(Int)
    
    var parameters: [String : CustomStringConvertible]? {
        switch self {
        case .creators(let data):
            var parameters: [String : CustomStringConvertible] = DefaultParameters.get()
            parameters["offset"] = data.offset
            parameters["limit"] = data.limit
            return parameters
        case .characterComics(let data):
            var parameters: [String : CustomStringConvertible] = DefaultParameters.get()
            parameters["characterId"] = data
            return parameters
        }
    }
    
    var path: String {
        switch self {
        case .creators:
            return "/v1/public/creators"
        case .characterComics(let data):
            return "/v1/public/characters/\(data)/comics"
        }
    }
    
}
