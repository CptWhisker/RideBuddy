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
                
                VStack(spacing: 16) {
                    ReelsView(reels: viewModel.reels)
                    
                    DestinationSelectionView(
                        buttonWidth: buttonWidth,
                        actionFrom: {
                            coordinator.navigationSource = .from
                            coordinator.navigateTo(.cityList)
                        },
                        actionTo: {
                            coordinator.navigationSource = .to
                            coordinator.navigateTo(.cityList)
                        },
                        changeAction: { viewModel.changeButtonTapped() },
                        destinationFrom: $viewModel.destinationFrom,
                        destinationTo: $viewModel.destinationTo
                    )
                    
                    if viewModel.isShowingSearchButton {
                        AppButtonView(
                            title: "Найти",
                            dimensions: CGSize(width: 150, height: 60),
                            action: { coordinator.navigateTo(.routeList) }
                        )
                    }
                    
                    Spacer()
                }
                .padding(.top, 24)
            }
            .navigationDestination(for: MainNavigationModel.self) { destination in
                switch destination {
                case .cityList:
                    CitiesListView(
                        coordinator: coordinator,
                        viewModel: viewModel,
                        cities: viewModel.filteredCities
                    )
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: Button(action: {
                        coordinator.navigateBack()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(.accent)
                    })
                    .toolbar(.hidden, for: .tabBar)
#warning("REFACTOR THIS CUSTOM NAV BUTTON")
                    
                case .stationList:
                    StationsListView(
                        coordinator: coordinator,
                        viewModel: viewModel,
                        stations: viewModel.filteredStations
                    )
                    
                case .routeList:
                    RouteListView(
                        destinationFrom: viewModel.destinationFrom!,
                        destinationTo: viewModel.destinationTo!
                    )
                    .toolbar(.hidden, for: .tabBar)
                    
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
