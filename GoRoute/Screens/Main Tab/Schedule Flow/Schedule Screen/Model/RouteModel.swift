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
    
    var startTimeInSeconds: Int {
        startTime.timeInSecondsSinceStartOfDay
    }
    
    var formattedTravelDate: String {
        travelDate.formatted(by: "dd MMMM")
    }
    
    var formattedStartTime: String {
        startTime.formatted(by: "HH:mm")
    }
    
    var formattedEndTime: String {
        endTime.formatted(by: "HH:mm")
    }
}
