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
        ZStack {
            Color.gray
                .ignoresSafeArea()
                .opacity(0.25)
            
            VStack(spacing: 20) {
                ForEach(MainScreenAction.allCases) { action in
                    MainScreenButton(title: action.rawValue) {
                        action.performAction(on: viewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    MainScreen(viewModel: MainScreenViewModel())
}

private extension MainScreen {
    
    struct MainScreenButton: View {
        
        let title: String
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Text(title)
                    .font(.headline)
                    .frame(width: 300, height: 60)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.buttonBorder)
                    .shadow(radius: 5)
            }
        }
    }
}
