//
//  MainScreenView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 10.11.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            Text("Main Screen")
        }
    }
}

#Preview {
    MainScreenView(viewModel: MainScreenViewModel())
}
