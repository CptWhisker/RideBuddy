//
//  SettingsScreenCoordinator.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

final class SettingsScreenCoordinator: CoordinatorProtocol {
    
    typealias Destination = SettingsNavigationModel
    
    @Published var path = NavigationPath()
}
