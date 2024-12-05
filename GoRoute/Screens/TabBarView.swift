//
//  TabBarView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 26.11.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var mainScreenViewModel: MainScreenViewModel
    @ObservedObject var routeListViewModel: RouteListViewModel
    @ObservedObject var settingsScreenViewModel: SettingsScreenViewModel
    
    var body: some View {
        TabView {
            MainScreenView(
                mainViewModel: mainScreenViewModel,
                routeViewModel: routeListViewModel
            )
            .tabItem { Image(systemName: "arrow.up.message") }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.main, for: .tabBar)
            
            SettingsScreenView(
                viewModel: settingsScreenViewModel
            )
            .tabItem { Image(systemName: "gearshape") }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.main, for: .tabBar)
        }
    }
}

#Preview {
    let mainScreenCoordinator = MainScreenCoordinator()
    let settingsScreenCoordinator = SettingsScreenCoordinator()
    
    TabBarView(
        mainScreenViewModel: MainScreenViewModel(),
        routeListViewModel: RouteListViewModel(),
        settingsScreenViewModel: SettingsScreenViewModel()
    )
    .environmentObject(mainScreenCoordinator)
    .environmentObject(settingsScreenCoordinator)
}
