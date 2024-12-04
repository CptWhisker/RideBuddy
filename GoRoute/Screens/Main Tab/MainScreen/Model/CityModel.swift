//
//  CityModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import Foundation

struct CityModel: Identifiable {
    let id = UUID()
    let name: String
    let stations: [StationModel]
}

struct StationModel: Identifiable {
    let id = UUID()
    let name: String
}
