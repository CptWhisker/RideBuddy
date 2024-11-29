//
//  MainScreenView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 10.11.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    var buttonWidth: CGFloat { screenWidth - 16 - 16 - 16 - 36 - 16 - 16 }
    var underlayWidth: CGFloat { screenWidth - 16 - 16 }
    
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            VStack(spacing: 44) {
                ReelsView(reels: viewModel.reels)
                
                DestinationSelectionView(
                    buttonWidth: buttonWidth,
                    actionFrom: { viewModel.fromButtonTapped() },
                    actionTo: { viewModel.toButtonTapped() },
                    changeAction: { viewModel.changeButtonTapped() },
                    destinationFrom: $viewModel.destinationFrom,
                    destinationTo: $viewModel.destinationTo
                )
                
                Spacer()
            }
            .padding(.top, 24)
        }
    }
}

#Preview {
    MainScreenView(viewModel: MainScreenViewModel())
}
