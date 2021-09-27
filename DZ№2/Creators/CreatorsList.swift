//
//  CreatorsList.swift
//  DZ№2
//
//  Created by Egor Malyshev on 27.09.2021.
//

import SwiftUI

struct CreatorsList: View {
    
    @EnvironmentObject var creatorsListViewModel: CreatorsScreenViewModel

    var body: some View {
        List {
            Section(header: listHeader) {
                ForEach(creatorsListViewModel.creatorList) { item in
                    CreatorListCell(creator: item)
                        .environmentObject(creatorsListViewModel)
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
    
    var listHeader: some View {
        Text(text)
    }
    
    var text: String {
        return creatorsListViewModel.creatorList.isEmpty ? "Loading list..." : "\(creatorsListViewModel.creatorList.count)/\(creatorsListViewModel.totalResults) (\(creatorsListViewModel.pageLoadCount))"
    }
}
