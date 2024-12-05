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
            
            List {
                ForEach(stations) { station in
                    NavigationRowView(title: station.name) {
                        handleSelection(of: station)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }
            
            if viewModel.filteredStations.isEmpty {
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.accent)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Выбор станции")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(
            text: $viewModel.searchStationText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Введите запрос"
        )
    }
    
    private func handleSelection(of station: StationModel) {
        viewModel.selectStation(station, for: coordinator.navigationSource)
        coordinator.returnToRoot()
    }
}

#Preview {
    StationsListView(
        coordinator: MainScreenCoordinator(),
        viewModel: MainScreenViewModel(),
        stations: MockDataProvider.mockCities.first!.stations
    )
}

