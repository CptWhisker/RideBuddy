//
//  GoRouteApp.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev  on 10.11.2024.
//

import SwiftUI

@main
struct GoRouteApp: App {
    
    @StateObject private var appState = AppState()
    
    @StateObject private var mainScreenViewModel = MainScreenViewModel()
    @StateObject private var reelsViewModel = ReelsViewModel()
    @StateObject private var routeListViewModel = RouteListViewModel()
    @StateObject private var mainScreenCoordinator = MainScreenCoordinator()
    
    @StateObject private var settingsScreenViewModel = SettingsScreenViewModel()
    @StateObject private var settingsScreenCoordinator = SettingsScreenCoordinator()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(appState)
                .environmentObject(mainScreenViewModel)
                .environmentObject(reelsViewModel)
                .environmentObject(routeListViewModel)
                .environmentObject(mainScreenCoordinator)
                .environmentObject(settingsScreenViewModel)
                .environmentObject(settingsScreenCoordinator)
                .preferredColorScheme(settingsScreenViewModel.isDarkModeEnabled ? .dark : .light)
        }
    }
}
