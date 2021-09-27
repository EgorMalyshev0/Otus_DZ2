//
//  ContentView.swift
//  DZ№2
//
//  Created by Egor Malyshev on 25.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavControllerView(transition: .custom(.moveAndFade)) {
            MarvelPickerView()
        }
    }
}
