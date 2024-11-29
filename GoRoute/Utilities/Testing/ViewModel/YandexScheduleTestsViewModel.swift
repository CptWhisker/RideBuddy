//
//  MainScreenViewModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 12.11.2024.
//

import SwiftUI
import OpenAPIURLSession

// MARK: - Protocol
protocol MainScreenViewModelProtocol: AnyObject {
    func getScheduleBetweenStations() async throws
    func getScheduleFromStation() async throws
    func getStationsForThread() async throws
    func getNearestStations() async throws
    func getNearestSettlement() async throws
    func getCarrierInfo() async throws
    func getStationsList() async throws
    func getCopyright() async throws
}

final class YandexScheduleTestsViewModel: ObservableObject {
    
    // MARK: Properties
    private var client: Client?
    private var scheduleService: YandexScheduleServiceProtocol?
    private let apiKey = "5412c04f-c459-4e7d-bc54-81dd504a1db6"
    
    // MARK: Initialization
    init() {
        do {
            client = try Client(
                serverURL: Servers.Server1.url(),
                transport: URLSessionTransport(),
                middlewares: [AuthenticationMiddlewareService(authorizationHeaderValue: apiKey)]
            )
            guard let client else { return }
            scheduleService = YandexScheduleService(client: client)
        } catch {
            print("Failed to create client with server URL: \(error.localizedDescription)")
        }
    }
}

// MARK: - Protocol Implementation
extension YandexScheduleTestsViewModel: MainScreenViewModelProtocol {
    
    func getScheduleBetweenStations() async throws {
        let result = try await scheduleService?.getScheduleBetweenStations(stationFrom: "c213", stationTo: "c2")
        if
            let schedule = result?.first,
            let routeTitle = schedule.thread?.title,
            let routeNumber = schedule.thread?.number,
            let departureDate = schedule.start_date {
            print("Отправление под номером '\(routeNumber)' проследует по маршруту '\(routeTitle)' \(departureDate)")
        }
    }
    
    func getScheduleFromStation() async throws {
        let result = try await scheduleService?.getScheduleFromStation(station: "s9600213")
        print("Ближайшее отправление для станции '\(result?.station?.title ??  "Неизвестная станция")' проследует по маршруту '\(result?.schedule?.first?.thread?.title ?? "Неизвестный маршрут")'")
    }
    
    func getStationsForThread() async throws {
        let result = try await scheduleService?.getStationsForThread(threadID: "727A_7_2")
        let stops = result?.stops?.compactMap({$0.station?.title})
        print("Отправление '\(result?.number ?? "Неизвестное отправление")', следующее по маршруту '\(result?.title ?? "Неизвестный маршрут")', проходит через станции: '\(stops?.joined(separator: ", ") ?? "Неизвестные станции")' ")
    }
    
    func getNearestStations() async throws {
        let result = try await scheduleService?.getNearestStations(lat: 59.864177, lon: 30.319163, distance: 50, limit: 5)
        result?.stations?.forEach { print("Ближайшая станция: \($0.title ?? "Неизвестная станция")") }
    }
    
    func getNearestSettlement() async throws {
        let result = try await scheduleService?.getNearestSettlement(lat: 59.864177, lon: 30.319163, distance: 50)
        print("Ближайший населенный пункт: \(result?.title ?? "Неизвестный населенный пункт")")
    }
    
    func getCarrierInfo() async throws {
        let result = try await scheduleService?.getCarrierInfo(code: 680)
        print("Перевозчик: \(result?.carrier?.title ?? "Неизвестный перевозчик")")
    }
    
    func getStationsList() async throws {
        let result = try await scheduleService?.getStationsList()
        if
            let randomCountry = result?.countries?.randomElement(),
            let randomRegion = randomCountry.regions?.randomElement(),
            let randomSettlement = randomRegion.settlements?.randomElement(),
            let stationsCount = randomSettlement.stations?.count {
            print("Страна: \(randomCountry.title ?? "Неизвестная страна")\nРегион: \(randomRegion.title ?? "Неизвестный регион")\nГород: \(randomSettlement.title ?? "Неизвестный город")\nКоличество станций: \(stationsCount)")
        }
    }
    
    func getCopyright() async throws {
        let result = try await scheduleService?.getCopyright()
        print("Копирайт: \(result?.text ?? "Информация недоступна")")
    }
}
