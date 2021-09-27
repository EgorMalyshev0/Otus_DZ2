//
//  CreatorScreen.swift
//  DZ№2
//
//  Created by Egor Malyshev on 27.09.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CreatorScreen: View {
    
    @EnvironmentObject var creatorsListViewModel: CreatorsScreenViewModel

    var creator: Creator
    
    var imageURL: String {
        if let path = creator.thumbnail?.path, let ext = creator.thumbnail?.imageExtension {
            return path + "." + ext
        } else {
            return ""
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                NavPopButton(destination: .previous) {
                    Image(systemName: "arrow.left")
                        .font(.title)
                }
                
                Text(creator.fullName.asStringOrEmpty)
                    .font(.title)
                
                Text("ID \(creator.id.asStringOrEmpty)")
                    .font(.caption)
                
                WebImage(url: URL(string: imageURL))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)

                if let items = creator.stories?.items, items.isEmpty {
                    Text("Creator has no stories")
                } else {
                    NavPushButton(destination: CreatorStoriesScreen(stories: creator.stories?.items ?? [])) {
                        Text("Show \(creator.stories?.items?.count ?? 0) stories")
                    }
                    .font(.caption2)
                    .foregroundColor(Color.blue)
                }
                
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
        }
    }
    
}

