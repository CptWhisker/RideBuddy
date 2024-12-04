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
}
