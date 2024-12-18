//
//  MainScreenViewModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI
import Combine

final class MainScreenViewModel: ObservableObject {
    
    // MARK: Properties
    @Published private(set) var filteredCities = [CityModel]()
    @Published private(set) var filteredStations = [StationModel]()
    @Published var destinationFrom: SelectionModel?
    @Published var destinationTo: SelectionModel?
    @Published var searchCityText: String = ""
    @Published var searchStationText: String = ""
    @Published var isShowingSearchButton: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    private var cities = [CityModel]()
    private var selectedCity: CityModel? {
        didSet {
            getStations()
        }
    }
    
    // MARK: Initialization
    init() {
        getData()
        makeSubscriptions()
    }
}

// MARK: - Data Management
private extension MainScreenViewModel {
    
    // MARK: Data Acquisition
    func getData() {
        getCities()
    }
    
    func getCities() {
        cities = MockDataProvider.mockCities
        filteredCities = cities
    }
    
    func getStations() {
        filteredStations = selectedCity?.stations ?? []
    }
    
    // MARK: Data Filtering
    func filterCities(by text: String) {
        if text.isEmpty {
            filteredCities = cities
        } else {
            filteredCities = cities.filter { $0.name.lowercased().contains(text.lowercased()) }
        }
    }
    
    private func filterStations(by text: String) {
        guard let selectedCity else { return }
        
        if text.isEmpty {
            filteredStations = selectedCity.stations
        } else {
            filteredStations = selectedCity.stations.filter { $0.name.lowercased().contains(text.lowercased()) }
        }
    }
}

// MARK: - Subscriptions
private extension MainScreenViewModel {
    
    func makeSubscriptions() {
        makeCitySearchSubscription()
        makeStationSearchSubscription()
        makeSearchButtonVisibilitySubscription()
    }
    
    func makeCitySearchSubscription() {
        $searchCityText
            .debounce(for: .seconds(0.25), scheduler: DispatchQueue.main)
            .sink { [weak self] newText in
                guard let self else { return }
                
                self.filterCities(by: newText)
            }
            .store(in: &cancellables)
    }
    
    func makeStationSearchSubscription() {
        $searchStationText
            .debounce(for: .seconds(0.25), scheduler: DispatchQueue.main)
            .sink { [weak self] newText in
                guard let self else { return }
                
                self.filterStations(by: newText)
            }
            .store(in: &cancellables)
    }
    
    func makeSearchButtonVisibilitySubscription() {
        Publishers.CombineLatest($destinationFrom, $destinationTo)
            .sink { [weak self] destinationFrom, destinationTo in
                guard let self else { return }
                
                self.isShowingSearchButton = (destinationFrom != nil && destinationTo != nil)
            }
            .store(in: &cancellables)
    }
}

// MARK: - Private Methods
private extension MainScreenViewModel {
    
    func resetSearchText() {
        searchCityText = ""
        searchStationText = ""
    }
}

// MARK: - Public Methods
extension MainScreenViewModel {
    
    func selectCity(_ city: CityModel) {
        selectedCity = city
    }
    
    func selectStation(_ station: StationModel, for navigationSource: NavigationSource) {
        resetSearchText()
        
        switch navigationSource {
        case .from:
            destinationFrom = SelectionModel(
                cityName: selectedCity?.name,
                station: station
            )
            
        case .to:
            destinationTo = SelectionModel(
                cityName: selectedCity?.name,
                station: station
            )
            
        case .none:
            break
        }
    }
    
    func changeButtonTapped() {
        (destinationFrom, destinationTo) = (destinationTo, destinationFrom)
    }
}
