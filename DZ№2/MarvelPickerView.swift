//
//  MarvelPickerView.swift
//  DZ№2
//
//  Created by Egor Malyshev on 27.09.2021.
//

import SwiftUI

struct MarvelPickerView: View {
    
    @ObservedObject var charactersListViewModel: CharactersScreenViewModel = .init()
    @ObservedObject var creatorsListViewModel: CreatorsScreenViewModel = .init()
    @ObservedObject var globalViewModel: GlobalViewModel = .init()

    var settings = ["Characters", "Creators"]
    
    @State var collectionViewChoice = 0
    
    var body: some View {
            VStack {
                Picker("Options", selection: $collectionViewChoice) {
                    ForEach(0 ..< settings.count) { index in
                        Text(self.settings[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                if collectionViewChoice == 0 {
                    CharactersList().environmentObject(charactersListViewModel)
                        .onAppear {
                            self.collectionViewChoice = 0
                            if charactersListViewModel.characterList.isEmpty {
                                charactersListViewModel.loadPage()
                            }
                        }
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                } else if collectionViewChoice == 1 {
                    CreatorsList().environmentObject(creatorsListViewModel)
                        .onAppear {
                            self.collectionViewChoice = 1
                            if creatorsListViewModel.creatorList.isEmpty {
                                creatorsListViewModel.loadPage()
                            }
                        }
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                }
                Spacer()
            }
    }
}
