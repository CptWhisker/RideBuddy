//
//  MockDataProvider.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import Foundation

// MARK: - Mock Data
struct MockDataProvider {
    
    static let mockCities: [CityModel] = [
        CityModel(
            name: "Минас Тирит",
            stations: [
                StationModel(name: "Белая Башня"),
                StationModel(name: "Пеленнорские Поля"),
                StationModel(name: "Речные Врата")
            ]
        ),
        CityModel(
            name: "Изенгард",
            stations: [
                StationModel(name: "Ортханк"),
                StationModel(name: "Западное Кольцо"),
                StationModel(name: "Фангорн")
            ]
        ),
        CityModel(
            name: "Ривенделл",
            stations: [
                StationModel(name: "Зал Элронда"),
                StationModel(name: "Восточная Долина"),
                StationModel(name: "Тайное Убежище")
            ]
        ),
        CityModel(
            name: "Хоббитон",
            stations: [
                StationModel(name: "Бэг Энд"),
                StationModel(name: "Зеленый Дракон"),
                StationModel(name: "Большой Холм")
            ]
        )
    ]
    
    static let mockStations: [StationModel] = [
        StationModel(name: "Белая Башня"),
        StationModel(name: "Пеленнорские Поля"),
        StationModel(name: "Речные Врата"),
        StationModel(name: "Ортханк")
    ]
    
    static let mockCarrier: CarrierModel = CarrierModel(
        shortName: "РЖД",
        fullName: "ОАО \"РЖД\"",
        smallLogo: .brandSmallLogo,
        fullLogo: .brandFullLogo,
        email: "rzd@rzd.ru",
        phone: "+7-000-000-00-00"
    )
    
    static let mockRoute: RouteModel = RouteModel(
        origin: mockStations.first!,
        destination: mockStations.last!,
        carrier: mockCarrier,
        travelDate: Date(timeIntervalSinceNow: 3600 * 5),
        startTime: Date(timeIntervalSinceNow: 3600 * 5),
        endTime: Date(timeIntervalSinceNow: 3600 * 17),
        transfers: [mockCities[1]]
    )
    
    static let mockRoutes: [RouteModel] = {
        var routes: [RouteModel] = []
        
        for _ in 0..<20 {
            let route = RouteModel(
                origin: mockStations.randomElement()!,
                destination: mockStations.randomElement()!,
                carrier: mockCarrier,
                travelDate: Date(timeIntervalSinceNow: 3600 * 5),
                startTime: Date(timeIntervalSinceNow: 3600 * 5),
                endTime: Date(timeIntervalSinceNow: Double.random(in: 3600 * 10 ... 3600 * 20)),
                transfers: [mockCities.randomElement()!]
            )
            routes.append(route)
        }
        
        return routes
    }()
    
    static let mockSelections: [SelectionModel] = [
        SelectionModel(cityName: mockCities.first!.name, station: mockCities.first!.stations.first!),
        SelectionModel(cityName: mockCities.last!.name, station: mockCities.last!.stations.last!)
    ]
}
