//
//  GoRouteApp.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev  on 10.11.2024.
//

import SwiftUI

@main
struct GoRouteApp: App {
    
    @StateObject var mainScreenViewModel = MainScreenViewModel()
    @StateObject var settingsScreenViewModel = SettingsScreenViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabBarView(
                mainScreenViewModel: mainScreenViewModel,
                settingsScreenViewModel: settingsScreenViewModel
            )
                .preferredColorScheme(settingsScreenViewModel.isDarkModeEnabled ? .dark : .light)
        }
    }
}
