//
//  MainScreenView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 10.11.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @EnvironmentObject var coordinator: MainScreenCoordinator
    
    @ObservedObject var mainViewModel: MainScreenViewModel
    @ObservedObject var routeViewModel: RouteListViewModel
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.main
                    .ignoresSafeArea()
                
                VStack(spacing: LayoutProvider.Spacing.extraLarge) {
                    ReelsView(reels: mainViewModel.reels)
                    
                    DestinationSelectionView(
                        actionFrom: {
                            fromButtonTapped()
                        },
                        actionTo: {
                            toButtonTapped()
                        },
                        changeAction: {
                            changeButtonTapped()
                        },
                        destinationFrom: $mainViewModel.destinationFrom,
                        destinationTo: $mainViewModel.destinationTo
                    )
                    
                    if mainViewModel.isShowingSearchButton {
                        searchButton
                    }
                    
                    Spacer()
                }
                .padding(.top, LayoutProvider.Padding.large)
            }
            .navigationDestination(for: MainNavigationModel.self) { destination in
                switch destination {
                    
                case .cityList:
                    CitiesListView(
                        coordinator: coordinator,
                        viewModel: mainViewModel,
                        cities: mainViewModel.filteredCities
                    )
                    .navigationBackButton(coordinator: coordinator)
                    .toolbar(.hidden, for: .tabBar)
                    
                case .stationList:
                    StationsListView(
                        coordinator: coordinator,
                        viewModel: mainViewModel,
                        stations: mainViewModel.filteredStations
                    )
                    .navigationBackButton(coordinator: coordinator)
                    
                case .routeList:
                    RouteListView(
                        viewModel: routeViewModel,
                        coordinator: coordinator
                    )
                    .navigationBackButton(coordinator: coordinator)
                    .toolbar(.hidden, for: .tabBar)
                    
                case .carrierDetails:
                    if let carrier = routeViewModel.selectedCarrier {
                        CarrierDetailsView(carrier: carrier)
                            .navigationBackButton(coordinator: coordinator)
                    }
                    
                case .filterScreen:
                    FilterView(
                        viewModel: routeViewModel,
                        coordinator: coordinator
                    )
                        .navigationBackButton(coordinator: coordinator)
                }
            }
        }
    }
    
    // MARK: Subviews
    private var searchButton: some View {
        AppButtonView(
            isPresented: .constant(false),
            title: "Найти",
            width: LayoutProvider.Dimensions.Button.appSmallWidth,
            action: {
                searchButtonTapped()
            }
        )
    }
}

// MARK: - Private Methods
private extension MainScreenView {
    
    func fromButtonTapped() {
        coordinator.navigationSource = .from
        coordinator.navigateTo(.cityList)
    }
    
    func toButtonTapped() {
        coordinator.navigationSource = .to
        coordinator.navigateTo(.cityList)
    }
    
    func changeButtonTapped() {
        mainViewModel.changeButtonTapped()
    }
    
    func searchButtonTapped() {
        routeViewModel.updateDestinations(
            destinationFrom: mainViewModel.destinationFrom,
            destinationTo: mainViewModel.destinationTo
        )
        coordinator.navigateTo(.routeList)
    }
}

// MARK: - Preview
#Preview {
    let coordinator = MainScreenCoordinator()
    MainScreenView(
        mainViewModel: MainScreenViewModel(),
        routeViewModel: RouteListViewModel()
    )
    .environmentObject(coordinator)
}
