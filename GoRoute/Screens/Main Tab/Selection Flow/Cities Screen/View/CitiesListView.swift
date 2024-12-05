//
//  SelectionListView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

struct CitiesListView: View {
    
    @ObservedObject var coordinator: MainScreenCoordinator
    @ObservedObject var viewModel: MainScreenViewModel
    
    let cities: [CityModel]
    
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            List {
                ForEach(cities) { city in
                    NavigationRowView(title: city.name) {
                        handleSelection(of: city)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }
            
            if viewModel.filteredCities.isEmpty {
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.accent)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(
            text: $viewModel.searchCityText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Введите запрос"
        )
    }
    
    private func handleSelection(of city: CityModel) {
        viewModel.selectCity(city)
        coordinator.navigateTo(.stationList)
    }
}

#Preview {
    CitiesListView(
        coordinator: MainScreenCoordinator(),
        viewModel: MainScreenViewModel(),
        cities: MockDataProvider.mockCities
    )
}
