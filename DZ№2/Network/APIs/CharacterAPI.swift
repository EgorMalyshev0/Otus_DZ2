//
//  CharacterAPI.swift
//  DZ№2
//
//  Created by Egor Malyshev on 25.09.2021.
//

import Foundation

class CharacterApi {
    class func getCharacters(request: CharactersRequest, completion: @escaping (BaseResponse<Character>?) -> Void) {
        let route = CharacterRouter.characters(request)
        NetworkService().performRequest(route: route) { (result: Result<BaseResponse<Character>, Error>) in
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

enum CharacterRouter: APIRouter {
    
    case characters(CharactersRequest), characterComics(Int)
    
    var parameters: [String : CustomStringConvertible]? {
        switch self {
        case .characters(let data):
            var parameters: [String : CustomStringConvertible] = DefaultParameters.get()
            parameters["offset"] = data.offset
            parameters["limit"] = data.limit
            if let nameStartsWith = data.nameStartsWith {
                parameters["nameStartsWith"] = nameStartsWith
            }
            
            return parameters
        case .characterComics(let data):
            var parameters: [String : CustomStringConvertible] = DefaultParameters.get()
            parameters["characterId"] = data
            return parameters
        }
    }
    
    var path: String {
        switch self {
        case .characters:
            return "/v1/public/characters"
        case .characterComics(let data):
            return "/v1/public/characters/\(data)/comics"
        }
    }
    
}
