//
//  CharactersViewModel.swift
//  DZ№2
//
//  Created by Egor Malyshev on 26.09.2021.
//

import Foundation

final class CharactersScreenViewModel: ObservableObject {
    
    @Published var characterList: [Character] = .init()
    @Published var page: Int = 0
    @Published var isPageLoading: Bool = false
    @Published var totalResults: Int = 50000
    @Published var pageLoadCount: Int = 0
    
    @Published var comicsList: [Comic] = .init()
    @Published var areComicsLoading: Bool = false
    
    var nameStartsWith = "a"
    
    func loadPage() {
        guard isPageLoading == false, characterList.count < totalResults else {
            return
        }
        isPageLoading = true
        page += 1
        let request = CharactersRequest(nameStartsWith: nameStartsWith, limit: 20, offset: characterList.count)
        CharacterApi.getCharacters(request: request) { response in
            self.isPageLoading = false
            guard let response = response else { return }
            print(response)
            self.pageLoadCount += 1
            let list = response.data.results
            let filteredList = list.filter { character in
                if let path = character.thumbnail?.path {
                    return path.hasSuffix("image_not_available") ? false : true
                } else {
                    return false
                }
            }
            self.characterList.append(contentsOf: filteredList)
            self.totalResults = response.data.total
        }
    }
    
    func loadComics(byId id: Int) {
        areComicsLoading = true
        CharacterApi.getComics(byCharacterId: id) { response in
            self.areComicsLoading = false
            guard let response = response else { return }
            print(response)
            self.comicsList.append(contentsOf: response.data.results)
        }
    }
}
