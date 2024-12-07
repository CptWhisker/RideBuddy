//
//  TabBarView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 26.11.2024.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            MainScreenView()
                .tabItem { Image(systemName: ResourcesProvider.Icon.mainTabIcon) }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.main, for: .tabBar)
            
            SettingsScreenView()
                .tabItem { Image(systemName: ResourcesProvider.Icon.settingsTabIcon) }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.main, for: .tabBar)
        }
    }
}

// MARK: - Preview
#Preview {
    let appState = AppState()
    let mainScreenViewModel = MainScreenViewModel()
    let routeListViewModel = RouteListViewModel()
    let mainScreenCoordinator = MainScreenCoordinator()
    let settingsScreenViewModel = SettingsScreenViewModel()
    let settingsScreenCoordinator = SettingsScreenCoordinator()
    
    TabBarView()
        .environmentObject(appState)
        .environmentObject(mainScreenViewModel)
        .environmentObject(routeListViewModel)
        .environmentObject(mainScreenCoordinator)
        .environmentObject(settingsScreenViewModel)
        .environmentObject(settingsScreenCoordinator)
}
