//
//  MainScreenView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 10.11.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @EnvironmentObject var appState: AppState
    
    @EnvironmentObject var mainViewModel: MainScreenViewModel
    @EnvironmentObject var routeViewModel: RouteListViewModel
    
    @EnvironmentObject var coordinator: MainScreenCoordinator
    
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
                
                ErrorViewFactory.errorView(for: appState.errorState)
            }
            .navigationDestination(for: MainNavigationModel.self) { destination in
                destinationView(for: destination)
            }
        }
    }
}

// MARK: - Subviews
private extension MainScreenView {
    
    var searchButton: some View {
        AppButtonView(
            isNotificationPresented: .constant(false),
            title: "Найти",
            width: LayoutProvider.Dimensions.Button.appSmallWidth,
            action: {
                searchButtonTapped()
            }
        )
    }
    
    @ViewBuilder
    func destinationView(for destination: MainNavigationModel) -> some View {
        switch destination {
            
        case .cityList:
            CitiesListView(cities: mainViewModel.filteredCities)
                .navigationBackButton(coordinator: coordinator)
                .toolbar(.hidden, for: .tabBar)
            
        case .stationList:
            StationsListView(stations: mainViewModel.filteredStations)
                .navigationBackButton(coordinator: coordinator)
            
        case .routeList:
            RouteListView()
                .navigationBackButton(coordinator: coordinator)
                .toolbar(.hidden, for: .tabBar)
            
        case .carrierDetails:
            if let carrier = routeViewModel.selectedCarrier {
                CarrierDetailsView(carrier: carrier)
                    .navigationBackButton(coordinator: coordinator)
            }
            
        case .filterScreen:
            FilterView()
                .navigationBackButton(coordinator: coordinator)
        }
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
    let appState = AppState()
    let mainViewModel = MainScreenViewModel()
    let routeViewModel = RouteListViewModel()
    let coordinator = MainScreenCoordinator()
    
    MainScreenView()
        .environmentObject(appState)
        .environmentObject(mainViewModel)
        .environmentObject(routeViewModel)
        .environmentObject(coordinator)
}
