//
//  AnyTransition.swift
//  DZ№2
//
//  Created by Egor Malyshev on 26.09.2021.
//

import SwiftUI

public extension AnyTransition {
    
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
}
