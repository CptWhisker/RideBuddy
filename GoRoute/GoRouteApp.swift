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
    @StateObject private var routeListViewModel = RouteListViewModel()
    @StateObject private var mainScreenCoordinator = MainScreenCoordinator()
    
    @StateObject private var settingsScreenViewModel = SettingsScreenViewModel()
    @StateObject private var settingsScreenCoordinator = SettingsScreenCoordinator()
    
    var body: some Scene {
        WindowGroup {
            TabBarView(
                mainScreenViewModel: mainScreenViewModel,
                routeListViewModel: routeListViewModel,
                settingsScreenViewModel: settingsScreenViewModel
            )
            .environmentObject(mainScreenCoordinator)
            .environmentObject(settingsScreenCoordinator)
            .preferredColorScheme(settingsScreenViewModel.isDarkModeEnabled ? .dark : .light)
        }
    }
}
