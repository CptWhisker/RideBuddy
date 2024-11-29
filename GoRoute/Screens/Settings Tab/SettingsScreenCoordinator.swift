//
//  SettingsScreenCoordinator.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

final class SettingsScreenCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func navigateToUserAgreement() {
        path.append(SettingsNavigationModel.userAgreement)
    }
    
    func navigateBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func returnToRoot() {
        path = NavigationPath()
    }
}
