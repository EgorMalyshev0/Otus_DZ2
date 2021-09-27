//
//  CreatorStoriesScreen.swift
//  DZ№2
//
//  Created by Egor Malyshev on 27.09.2021.
//

import SwiftUI

struct CreatorStoriesScreen: View {
        
    var stories: [StorySummary]
    
    var body: some View {
        VStack {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrow.left")
                    .font(.title)
            }
            List {
                ForEach(stories) { item in
                    CreatorStoryListCell(story: item)
                }
            }
        }
        
    }
}
