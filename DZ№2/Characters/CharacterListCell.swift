//
//  CharacterListCell.swift
//  DZ№2
//
//  Created by Egor Malyshev on 26.09.2021.
//

import SwiftUI

struct CharacterListCell: View {
    
    @EnvironmentObject var charactersListViewModel: CharactersScreenViewModel
    
    var character: Character

    var body: some View {
        NavPushButton(destination: CharacterScreen(character: character).environmentObject(charactersListViewModel)) {
            Text(character.name.asStringOrEmpty)
                .onAppear() {
                    if self.charactersListViewModel.characterList.isLast(character) {
                        charactersListViewModel.loadPage()
                    }
                }
            if self.charactersListViewModel.characterList.isLast(character) && charactersListViewModel.isPageLoading {
                VStack(alignment: .center) {
                    Divider()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
    }
    
}
