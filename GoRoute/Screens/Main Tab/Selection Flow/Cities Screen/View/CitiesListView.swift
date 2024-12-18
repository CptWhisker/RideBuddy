//
//  SelectionListView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

struct CitiesListView: View {
    
    @EnvironmentObject var appState: AppState
    
    @EnvironmentObject var viewModel: MainScreenViewModel
    
    @EnvironmentObject var coordinator: MainScreenCoordinator
    
    let cities: [CityModel]
    
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            citiesList
            
            PlaceholderTextView(title: "Город не найден")
                .opacity(
                    viewModel.filteredCities.isEmpty ?
                    LayoutProvider.Opacity.visible : LayoutProvider.Opacity.invisible
                )

            
            ErrorViewFactory.errorView(for: appState.errorState)
        }
        .listStandardStyle(searchText: $viewModel.searchCityText, title: "Выбор города")
    }
}

// MARK: - Subviews
private extension CitiesListView {
    
    var citiesList: some View {
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
    let appState = AppState()
    let viewModel = MainScreenViewModel()
    let coordinator = MainScreenCoordinator()
    
    CitiesListView(
        cities: MockDataProvider.mockCities
    )
    .environmentObject(appState)
    .environmentObject(viewModel)
    .environmentObject(coordinator)
}
