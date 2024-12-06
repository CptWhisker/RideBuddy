//
//  RouteListViewModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

final class RouteListViewModel: ObservableObject {
    
    // MARK: Properties
    @Published private(set) var filteredRoutes = [RouteModel]()
    @Published private(set) var selectedRoute: RouteModel?
    @Published var selectedTimeFilters = Set<TimeFilterModel>()
    @Published var selectedTransferFilter: TransferFilterModel = .include
    @Published var areFiltersApplied = false
        
    private var storedTimeFilters = Set<TimeFilterModel>()
    private var storedTransferFilter: TransferFilterModel = .include
    private var destinationFrom: SelectionModel?
    private var destinationTo: SelectionModel?
    private var routes = [RouteModel]()
    private(set) var selectedCarrier: CarrierModel?
    
    var scheduleHeader: String {
        let fromCity = destinationFrom?.cityName ?? "Неизвестный город"
        let fromStation = destinationFrom?.station.name ?? "Неизвестная станция"
        let toCity = destinationTo?.cityName ?? "Неизвестный город"
        let toStation = destinationTo?.station.name ?? "Неизвестная станция"
        
        return "\(fromCity) (\(fromStation)) → \(toCity) (\(toStation))"
    }
    
    // MARK: Initialization
    init() {
        getData()
    }
}

// MARK: - Data Management
private extension RouteListViewModel {
    
    func getData() {
        getRoutes()
    }
    
    func getRoutes() {
        routes = MockDataProvider.mockRoutes
        filteredRoutes = routes
    }
}

// MARK: - Public Methods
extension RouteListViewModel {
    
    func updateDestinations(destinationFrom: SelectionModel?, destinationTo: SelectionModel?) {
        self.destinationFrom = destinationFrom
        self.destinationTo = destinationTo
    }
    
    func selectCarrier(_ carrier: CarrierModel) {
        selectedCarrier = carrier
    }
    
    func selectTimeFilter(_ timeFilter: TimeFilterModel) {
        if selectedTimeFilters.contains(timeFilter) {
            selectedTimeFilters.remove(timeFilter)
        } else {
            selectedTimeFilters.insert(timeFilter)
        }
    }
    
    func selectTransferFilter(_ transferFilter: TransferFilterModel) {
        selectedTransferFilter = transferFilter
    }
    
    func getTimeFilterImageName(_ timeFilter: TimeFilterModel) -> String {
        selectedTimeFilters.contains(timeFilter) ? ResourcesProvider.Icon.markedRectCheckbox : ResourcesProvider.Icon.emptyRectCheckbox
    }
    
    func getTransferFilterImageName(_ transferFilter: TransferFilterModel) -> String {
        selectedTransferFilter == transferFilter ? ResourcesProvider.Icon.markedCircleCheckbox : ResourcesProvider.Icon.emptyCircleCheckbox
    }
    
    func applyRoutesFilter() {
        storedTimeFilters = selectedTimeFilters
        storedTransferFilter = selectedTransferFilter
        
        filteredRoutes = routes.filter { route in
            let matchesTimePeriod = selectedTimeFilters.isEmpty || selectedTimeFilters.contains(where: {
                let filterPerod = $0.timePeriod
                
                return filterPerod.start <= route.startTimeInSeconds && route.startTimeInSeconds <= filterPerod.end
            })
            
            let matchesTransfers = selectedTransferFilter == .include ? !route.transfers.isEmpty : route.transfers.isEmpty
            
            
            return matchesTimePeriod && matchesTransfers
        }
        
        areFiltersApplied = !(selectedTimeFilters.isEmpty && selectedTransferFilter == .include)
    }
    
    func resetTemporarySelections() {
        selectedTimeFilters = storedTimeFilters
        selectedTransferFilter = storedTransferFilter
    }
}
