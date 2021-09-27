//
//  CharactersList.swift
//  DZ№2
//
//  Created by Egor Malyshev on 26.09.2021.
//

import SwiftUI

struct CharactersList: View {
    
    @EnvironmentObject var charactersListViewModel: CharactersScreenViewModel

    var body: some View {
        List {
            Section(header: listHeader) {
                ForEach(charactersListViewModel.characterList) { item in
                    CharacterListCell(character: item)
                        .environmentObject(charactersListViewModel)
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
    
    var listHeader: some View {
        Text(text)
    }
    
    var text: String {
        return charactersListViewModel.characterList.isEmpty ? "Loading list... (name starts with: \(charactersListViewModel.nameStartsWith))" : "\(charactersListViewModel.characterList.count)/\(charactersListViewModel.totalResults) (\(charactersListViewModel.pageLoadCount))"
    }
}
