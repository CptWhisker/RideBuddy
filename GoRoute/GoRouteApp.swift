//
//  GoRouteApp.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev  on 10.11.2024.
//

import SwiftUI

@main
struct GoRouteApp: App {
    
    @StateObject private var mainScreenViewModel = MainScreenViewModel()
    @StateObject private var mainScreenCoordinator = MainScreenCoordinator()
    
    @StateObject private var settingsScreenViewModel = SettingsScreenViewModel()
    @StateObject private var settingsScreenCoordinator = SettingsScreenCoordinator()
    
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            TabBarView(
                mainScreenViewModel: mainScreenViewModel,
                settingsScreenViewModel: settingsScreenViewModel
            )
            .environmentObject(mainScreenCoordinator)
            .environmentObject(settingsScreenCoordinator)
            .environmentObject(appState)
            .preferredColorScheme(settingsScreenViewModel.isDarkModeEnabled ? .dark : .light)
        }
    }
}
