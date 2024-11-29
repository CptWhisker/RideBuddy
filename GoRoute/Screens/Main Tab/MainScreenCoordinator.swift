//
//  MainScreenCoordinator.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

final class MainScreenCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func navigateToCitiesList() {
        path.append(MainNavigationModel.cityList)
    }
    
    func navigateToStationsList() {
        path.append(MainNavigationModel.stationList)
    }
    
    func navigateToCarrierList() {
        path.append(MainNavigationModel.carrierList)
    }
    
    func navigateToCarrierDetails() {
        path.append(MainNavigationModel.carrierDetails)
    }
    
    func navigateToFilterScreen() {
        path.append(MainNavigationModel.filterScreen)
    }
    
    func navigateBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func returnToRoot() {
        path = NavigationPath()
    }
}
