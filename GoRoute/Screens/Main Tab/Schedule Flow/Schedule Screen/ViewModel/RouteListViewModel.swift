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
    
    func updateDestinations(destinationFrom: SelectionModel?, destinationTo: SelectionModel?) {
        self.destinationFrom = destinationFrom
        self.destinationTo = destinationTo
    }
    
    func selectCarrier(_ carrier: CarrierModel) {
        selectedCarrier = carrier
    }
}
