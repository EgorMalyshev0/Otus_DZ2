//
//  CreatorListCell.swift
//  DZ№2
//
//  Created by Egor Malyshev on 27.09.2021.
//

import SwiftUI

struct CreatorListCell: View {
    
    @EnvironmentObject var creatorsListViewModel: CreatorsScreenViewModel
    
    var creator: Creator

    var body: some View {
        NavPushButton(destination: CreatorScreen(creator: creator).environmentObject(creatorsListViewModel)) {
            Text(creator.fullName.asStringOrEmpty)
                .onAppear() {
                    if self.creatorsListViewModel.creatorList.isLast(creator) {
                        creatorsListViewModel.loadPage()
                    }
                }
            if self.creatorsListViewModel.creatorList.isLast(creator) && creatorsListViewModel.isPageLoading {
                VStack(alignment: .center) {
                    Divider()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
    }
    
}
