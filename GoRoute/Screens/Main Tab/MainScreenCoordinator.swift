//
//  MainScreenCoordinator.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

final class MainScreenCoordinator: CoordinatorProtocol {
    
    typealias Destination = MainNavigationModel
    
    @Published var path = NavigationPath()
    @Published var navigationSource: NavigationSource = .none
}

// MARK: - Custom Implementation
extension MainScreenCoordinator {
    
    func prepareForRootReset() {
        navigationSource = .none
    }
}
