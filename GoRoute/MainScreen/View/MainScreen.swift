//
//  ContentView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 10.11.2024.
//

import SwiftUI

struct MainScreen: View {
    
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        Text("Main Screen")
    }
}

#Preview {
    MainScreen(viewModel: MainScreenViewModel())
}
