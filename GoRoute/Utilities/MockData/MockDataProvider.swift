//
//  MockDataProvider.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import Foundation

// MARK: - Mock Data
struct MockDataProvider {
    
    // MARK: Reels
    static let mockReelGroups: [ReelGroupModel] = [
        ReelGroupModel(
            thumbnail: ResourcesProvider.ReelGroup.Reel1.thumbnailImage,
            reels: [
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel1.reelImage1, title: "Reel 1_1", description: "Description 1_1"),
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel1.reelImage2, title: "Reel 1_2", description: "Description 1_2")
            ]
        ),
        ReelGroupModel(
            thumbnail: ResourcesProvider.ReelGroup.Reel2.thumbnailImage,
            reels: [
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel2.reelImage1, title: "Reel 2_1", description: "Description 2_1"),
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel2.reelImage2, title: "Reel 2_2", description: "Description 2_2")
            ]
        ),
        ReelGroupModel(
            thumbnail: ResourcesProvider.ReelGroup.Reel3.thumbnailImage,
            reels: [
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel3.reelImage1, title: "Reel 3_1", description: "Description 3_1"),
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel3.reelImage2, title: "Reel 3_2", description: "Description 3_2")
            ]
        ),
        ReelGroupModel(
            thumbnail: ResourcesProvider.ReelGroup.Reel4.thumbnailImage,
            reels: [
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel4.reelImage1, title: "Reel 4_1", description: "Description 4_1"),
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel4.reelImage2, title: "Reel 4_2", description: "Description 4_2")
            ]
        ),
        ReelGroupModel(
            thumbnail: ResourcesProvider.ReelGroup.Reel5.thumbnailImage,
            reels: [
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel5.reelImage1, title: "Reel 5_1", description: "Description 5_1"),
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel5.reelImage2, title: "Reel 5_2", description: "Description 5_2")
            ]
        ),
        ReelGroupModel(
            thumbnail: ResourcesProvider.ReelGroup.Reel6.thumbnailImage,
            reels: [
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel6.reelImage1, title: "Reel 6_1", description: "Description 6_1"),
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel6.reelImage2, title: "Reel 6_2", description: "Description 6_2")
            ]
        ),
        ReelGroupModel(
            thumbnail: ResourcesProvider.ReelGroup.Reel7.thumbnailImage,
            reels: [
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel7.reelImage1, title: "Reel 7_1", description: "Description 7_1"),
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel7.reelImage2, title: "Reel 7_2", description: "Description 7_2")
            ]
        ),
        ReelGroupModel(
            thumbnail: ResourcesProvider.ReelGroup.Reel8.thumbnailImage,
            reels: [
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel8.reelImage1, title: "Reel 8_1", description: "Description 8_1"),
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel8.reelImage2, title: "Reel 8_2", description: "Description 8_2")
            ]
        ),
        ReelGroupModel(
            thumbnail: ResourcesProvider.ReelGroup.Reel9.thumbnailImage,
            reels: [
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel9.reelImage1, title: "Reel 9_1", description: "Description 9_1"),
                ReelModel(contentImage: ResourcesProvider.ReelGroup.Reel9.reelImage2, title: "Reel 9_2", description: "Description 9_2")
            ]
        )
    ]
    
    // MARK: Cities
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
    
    // MARK: Stations
    static let mockStations: [StationModel] = [
        StationModel(name: "Белая Башня"),
        StationModel(name: "Пеленнорские Поля"),
        StationModel(name: "Речные Врата"),
        StationModel(name: "Ортханк")
    ]
    
    // MARK: Carriers
    static let mockCarrier: CarrierModel = CarrierModel(
        shortName: "РЖД",
        fullName: "ОАО \"РЖД\"",
        smallLogo: .brandSmallLogo,
        fullLogo: .brandFullLogo,
        email: "rzd@rzd.ru",
        phone: "+7-000-000-00-00"
    )
    
    // MARK: Routes
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
        
        let routeCount = Int.random(in: 20...30)
        
        for _ in 0..<routeCount {
            let origin = mockStations.randomElement()!
            let destination = mockStations.randomElement()!
            
            guard origin.name != destination.name else { continue }
            
            let travelDate = Date(timeIntervalSinceNow: TimeInterval.random(in: 3600 * 1 ... 3600 * 24 * 14))
            
            let startTime = travelDate
            let endTime = startTime.addingTimeInterval(TimeInterval.random(in: 3600 * 3 ... 3600 * 10))
            
            let hasTransfers = Bool.random()
            let transfers = hasTransfers ? [mockCities.randomElement()!] : []
            
            let route = RouteModel(
                origin: origin,
                destination: destination,
                carrier: mockCarrier,
                travelDate: travelDate,
                startTime: startTime,
                endTime: endTime,
                transfers: transfers
            )
            routes.append(route)
        }
        
        return routes
    }()
    
    // MARK: Selections
    static let mockSelections: [SelectionModel] = [
        SelectionModel(cityName: mockCities.first!.name, station: mockCities.first!.stations.first!),
        SelectionModel(cityName: mockCities.last!.name, station: mockCities.last!.stations.last!)
    ]
}
