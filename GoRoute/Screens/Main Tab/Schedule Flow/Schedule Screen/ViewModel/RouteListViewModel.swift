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
    
    private let destinationFrom: SelectionModel
    private let destinationTo: SelectionModel
    private var routes = [RouteModel]()
    
    var scheduleHeader: String {
        "\(destinationFrom.cityName ?? "") (\(destinationFrom.station.name)) → \(destinationTo.cityName ?? "") (\(destinationTo.station.name))"
    }
    
    // MARK: Initialization
    init(destinationFrom: SelectionModel, destinationTo: SelectionModel) {
        self.destinationFrom = destinationFrom
        self.destinationTo = destinationTo
        
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
    
    func filterRoutes(by timePeriod: (start: Date, end: Date)? = nil, and includeTransfers: Bool) {
        filteredRoutes = routes.filter { route in
            let matchesTimePeriod = timePeriod.map {
                $0.start <= route.startTime && route.startTime <= $0.end
            } ?? true

            let matchesTransfers = includeTransfers ? !route.transfers.isEmpty : route.transfers.isEmpty
            
            return matchesTimePeriod && matchesTransfers
        }
    }
}

// MARK: - Public Methods
extension RouteListViewModel {
    
    func selectRoute(_ route: RouteModel) {
        selectedRoute = route
    }
}
