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
    
    func listStandardStyle(searchText: Binding<String>, title: String) -> some View {
        self.modifier(ListStandardStyleModifier(searchText: searchText, title: title))
    }
    
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(
            shouldHide ?
            LayoutProvider.Opacity.invisible : LayoutProvider.Opacity.visible
        )
    }
    
    // MARK: (iOS 18.0, *) BugFix
    func ios18SearchableNavigationFix() -> some View {
        self
            .modifier(IOS18SearchableNavigationFixModifier())
    }
}

// MARK: - Conditional View Modifier
extension View {
    
    @ViewBuilder
    func applyIf<T: View>(_ condition: Bool, transform: (Self) -> T) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
