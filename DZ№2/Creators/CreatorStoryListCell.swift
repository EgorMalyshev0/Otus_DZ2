//
//  CreatorStoryListCell.swift
//  DZ№2
//
//  Created by Egor Malyshev on 27.09.2021.
//

import SwiftUI

struct CreatorStoryListCell: View {
    
    var story: StorySummary

    var body: some View {
        Text(story.name.asStringOrEmpty)
    }
}
