//
//  MainScreenView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 10.11.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @EnvironmentObject var coordinator: MainScreenCoordinator
    
    @ObservedObject var viewModel: MainScreenViewModel
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    private var buttonWidth: CGFloat { screenWidth - 16 - 16 - 16 - 36 - 16 - 16 }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.main
                    .ignoresSafeArea()
                
                VStack(spacing: 44) {
                    ReelsView(reels: viewModel.reels)
                    
                    DestinationSelectionView(
                        buttonWidth: buttonWidth,
                        actionFrom: { coordinator.navigateToCitiesList() },
                        actionTo: { coordinator.navigateToCitiesList() },
                        changeAction: { viewModel.changeButtonTapped() },
                        destinationFrom: $viewModel.destinationFrom,
                        destinationTo: $viewModel.destinationTo
                    )
                    
                    Spacer()
                }
                .padding(.top, 24)
            }
            .navigationDestination(for: MainNavigationModel.self) { destination in
                switch destination {
                case .cityList:
                    SelectionListView(coordinator: coordinator)
                        .toolbar(.hidden, for: .tabBar)
                case .stationList:
                    SelectionListView(coordinator: coordinator)
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    let coordinator = MainScreenCoordinator()
    MainScreenView(viewModel: MainScreenViewModel()).environmentObject(coordinator)
}
