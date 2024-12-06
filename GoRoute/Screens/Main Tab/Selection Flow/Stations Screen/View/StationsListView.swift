//
//  SelectionListView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import SwiftUI

struct StationsListView: View {
    
    @ObservedObject var coordinator: MainScreenCoordinator
    @ObservedObject var viewModel: MainScreenViewModel
    
    let stations: [StationModel]
    
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            stationsList
            
            if viewModel.filteredStations.isEmpty {
                PlaceholderTextView(title: "Станция не найдена")
            }
        }
        .listStandardStyle(searchText: $viewModel.searchStationText, title: "Выбор станции")
    }
    
    // MARK: Subviews
    private var stationsList: some View {
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
    
    private func rowTapped(for station: StationModel) {
        viewModel.selectStation(
            station,
            for: coordinator.navigationSource
        )
        coordinator.returnToRoot()
    }
}

// MARK: - Preview
#Preview {
    StationsListView(
        coordinator: MainScreenCoordinator(),
        viewModel: MainScreenViewModel(),
        stations: MockDataProvider.mockCities.first!.stations
    )
}

