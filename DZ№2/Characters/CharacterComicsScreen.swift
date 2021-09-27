//
//  CharacterComicsScreen.swift
//  DZ№2
//
//  Created by Egor Malyshev on 26.09.2021.
//

import SwiftUI

struct CharacterComicsScreen: View {
    
    @EnvironmentObject var charactersListViewModel: CharactersScreenViewModel
    
    var character: Character
    
    var body: some View {
        VStack {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrow.left")
                    .font(.title)
            }
            
            if charactersListViewModel.areComicsLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
            List {
                ForEach(charactersListViewModel.comicsList) { item in
                    CharacterComicListCell(comic: item)
                }
            }
        }
        
    }
}

