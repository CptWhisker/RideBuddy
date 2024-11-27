//
//  SettingsScreenViewModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 26.11.2024.
//

import SwiftUI

final class SettingsScreenViewModel: ObservableObject {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var isDarkModeEnabled: Bool {
        get { isDarkMode }
        set { isDarkMode = newValue }
    }
}
