//
//  SelectionListView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import SwiftUI

struct StationsListView: View {
    
    @EnvironmentObject var appState: AppState
    
    @EnvironmentObject var viewModel: MainScreenViewModel
    
    @EnvironmentObject var coordinator: MainScreenCoordinator
    
    let stations: [StationModel]
    
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            stationsList
            
            if viewModel.filteredStations.isEmpty {
                PlaceholderTextView(title: "Станция не найдена")
            }
            
            ErrorViewFactory.errorView(for: appState.errorState)
        }
        .listStandardStyle(searchText: $viewModel.searchStationText, title: "Выбор станции")
    }
}

// MARK: - Subviews
private extension StationsListView {
    
    var stationsList: some View {
        List {
            ForEach(stations) { station in
                NavigationRowView(title: station.name) {
                    rowTapped(for: station)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
        }
    }
}

// MARK: - Private Methods
private extension StationsListView {
    
    func rowTapped(for station: StationModel) {
        viewModel.selectStation(
            station,
            for: coordinator.navigationSource
        )
        coordinator.returnToRoot()
    }
}

// MARK: - Preview
#Preview {
    let appState = AppState()
    let viewModel = MainScreenViewModel()
    let coordinator = MainScreenCoordinator()
    
    StationsListView(
        stations: MockDataProvider.mockCities.first!.stations
    )
    .environmentObject(appState)
    .environmentObject(viewModel)
    .environmentObject(coordinator)
}

