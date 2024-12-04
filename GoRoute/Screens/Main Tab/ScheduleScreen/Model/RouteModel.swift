//
//  RouteModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import Foundation

struct RouteModel: Identifiable {
    let id = UUID()
    let origin: StationModel
    let destination: StationModel
    let carrier: CarrierModel
    let travelDate: Date
    let startTime: Date
    let endTime: Date
    let transfers: [CityModel]
}

// MARK: - Formatted Properties
extension RouteModel {
    
    var travelDuration: Int {
        Int(startTime.distance(to: endTime) / 3600)
    }
    
    var formattedTravelDate: String {
        travelDate.formatted("dd MMMM")
    }
    
    var formattedStartTime: String {
        startTime.formatted("HH:mm")
    }
    
    var formattedEndTime: String {
        endTime.formatted("HH:mm")
    }
}
