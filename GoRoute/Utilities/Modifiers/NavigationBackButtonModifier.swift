//
//  NavigationBackButtonModifier.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct NavigationBackButtonModifier<C: CoordinatorProtocol>: ViewModifier {
    
    let coordinator: C
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(
                    action: {
                        coordinator.navigateBack()
                    }) {
                        Image(systemName: ResourcesProvider.Icon.navigationBackButton)
                    })
    }
}
