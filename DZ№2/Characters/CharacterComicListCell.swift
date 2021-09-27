//
//  CharacterComicListCell.swift
//  DZ№2
//
//  Created by Egor Malyshev on 26.09.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterComicListCell: View {
        
    var comic: Comic
    
    var imageURL: String {
        if let path = comic.thumbnail?.path, let ext = comic.thumbnail?.imageExtension {
            return path + "." + ext
        } else {
            return ""
        }
    }

    var body: some View {
        HStack(spacing: 10) {
            WebImage(url: URL(string: imageURL))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
            
            Text(comic.title)
        }
    }
    
}
