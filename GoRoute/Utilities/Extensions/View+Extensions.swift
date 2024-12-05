//
//  View+Extensions.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

extension View {
    
    func navigationBackButton<C: CoordinatorProtocol>(coordinator: C) -> some View {
        self.modifier(NavigationBackButtonModifier(coordinator: coordinator))
    }
}
