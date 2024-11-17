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
    
    var body: some Scene {
        WindowGroup {
            MainScreen(viewModel: mainScreenViewModel)
        }
    }
}
