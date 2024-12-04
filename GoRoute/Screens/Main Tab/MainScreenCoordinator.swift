//
//  MainScreenCoordinator.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

final class MainScreenCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var navigationSource: NavigationSource = .none
    
    func navigateTo(_ destination: MainNavigationModel) {
        path.append(destination)
    }

    func navigateBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func returnToRoot() {
        navigationSource = .none
        path = NavigationPath()
    }
}
