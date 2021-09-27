//
//  CreatorsViewModel.swift
//  DZ№2
//
//  Created by Egor Malyshev on 27.09.2021.
//

import Foundation

final class CreatorsScreenViewModel: ObservableObject {
    
    @Published var creatorList: [Creator] = .init()
    @Published var page: Int = 0
    @Published var isPageLoading: Bool = false
    @Published var totalResults: Int = 50000
    @Published var pageLoadCount: Int = 0
    
    @Published var comicsList: [Comic] = .init()
    @Published var areComicsLoading: Bool = false
            
    func loadPage() {
        guard isPageLoading == false, creatorList.count < totalResults else {
            return
        }
        isPageLoading = true
        page += 1
        let request = CreatorsRequest(limit: 20, offset: creatorList.count)
        CreatorApi.getCreators(request: request) { response in
            self.isPageLoading = false
            guard let response = response else { return }
            print(response)
            self.pageLoadCount += 1
            self.creatorList.append(contentsOf: response.data.results)
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
