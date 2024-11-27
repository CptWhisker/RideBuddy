//
//  TabBarView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 26.11.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var mainScreenViewModel: MainScreenViewModel
    @ObservedObject var settingsScreenViewModel: SettingsScreenViewModel
    
    var body: some View {
        NavigationStack {
            TabView {
                MainScreenView(viewModel: mainScreenViewModel)
                    .tabItem { Image(systemName: "arrow.up.message") }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.main, for: .tabBar)
                
                SettingsScreenView(viewModel: settingsScreenViewModel)
                    .tabItem { Image(systemName: "gearshape") }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.main, for: .tabBar)
            }
        }
    }
}

#Preview {
    TabBarView(
        mainScreenViewModel: MainScreenViewModel(),
        settingsScreenViewModel: SettingsScreenViewModel()
    )
}
