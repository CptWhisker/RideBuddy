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
                        Task {
                            do {
                                try await action.performAction(on: viewModel)
                            } catch {
                                print(action.errorDescription, error.localizedDescription)
                            }
                        }
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
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(radius: 5)
            }
        }
    }
}
