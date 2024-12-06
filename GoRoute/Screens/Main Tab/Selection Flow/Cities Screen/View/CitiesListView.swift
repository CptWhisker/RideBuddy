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
            
            citiesList
            
            if viewModel.filteredCities.isEmpty {
                PlaceholderTextView(title: "Город не найден")
            }
        }
        .listStandardStyle(searchText: $viewModel.searchCityText, title: "Выбор города")
    }
    
    // MARK: Subviews
    private var citiesList: some View {
        List {
            ForEach(cities) { city in
                NavigationRowView(title: city.name) {
                    rowTapped(for: city)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
        }
    }
}

// MARK: - Private Methods
private extension CitiesListView {
    
    func rowTapped(for city: CityModel) {
        viewModel.selectCity(city)
        coordinator.navigateTo(.stationList)
    }
}

// MARK: - Preview
#Preview {
    CitiesListView(
        coordinator: MainScreenCoordinator(),
        viewModel: MainScreenViewModel(),
        cities: MockDataProvider.mockCities
    )
}
