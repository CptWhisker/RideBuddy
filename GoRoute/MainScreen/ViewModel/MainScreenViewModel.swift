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
    func getScheduleBetweenStations()
    func getScheduleFromStation()
    func getStationsForThread()
    func getNearestStations()
    func getNearestSettlement()
    func getCarrierInfo()
    func getStationsList()
    func getCopyright()
}

final class MainScreenViewModel: ObservableObject {
    
    // MARK: Properties
    private var client: Client?
    private var scheduleService: YandexScheduleServiceProtocol?
    private let apiKey = "5412c04f-c459-4e7d-bc54-81dd504a1db6"
    
    // MARK: Initialization
    init() {
        do {
            client = try Client(
                serverURL: Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            guard let client else { return }
            scheduleService = YandexScheduleService(client: client, apiKey: apiKey)
        } catch {
            print("Failed to create client with server URL: \(error.localizedDescription)")
        }
    }
}

// MARK: - Protocol Implementation
extension MainScreenViewModel: MainScreenViewModelProtocol {
    
    func getScheduleBetweenStations() {
        Task {
            do {
                let result = try await scheduleService?.getScheduleBetweenStations(stationFrom: "c213", stationTo: "c2")
                if
                    let schedule = result?.first,
                    let routeTitle = schedule.thread?.title,
                    let routeNumber = schedule.thread?.number,
                    let departureDate = schedule.start_date {
                    print("Отправление под номером '\(routeNumber)' проследует по маршруту '\(routeTitle)' \(departureDate)")
                }
            } catch {
                print("Failed to fetch schedule for provided stations: \(error.localizedDescription)")
            }
        }
    }
    
    func getScheduleFromStation() {
        Task {
            do {
                let result = try await scheduleService?.getScheduleFromStation(station: "s9600213")
                print("Ближайшее отправление для станции '\(result?.station?.title ??  "Неизвестная станция")' проследует по маршруту '\(result?.schedule?.first?.thread?.title ?? "Неизвестный маршрут")'")
            } catch {
                print("Failed to fetch schedule for provided station: \(error.localizedDescription)")
            }
        }
    }
    
    func getStationsForThread() {
        Task {
            do {
                let result = try await scheduleService?.getStationsForThread(threadID: "727A_7_2")
                let stops = result?.stops?.compactMap({$0.station?.title})
                print("Отправление '\(result?.number ?? "Неизвестное отправление")', следующее по маршруту '\(result?.title ?? "Неизвестный маршрут")', проходит через станции: '\(stops?.joined(separator: ", ") ?? "Неизвестные станции")' ")
            } catch {
                print("Failed to fetch stations within provided thread: \(error.localizedDescription)")
            }
        }
    }
    
    func getNearestStations() {
        Task {
            do {
                let result = try await scheduleService?.getNearestStations(lat: 59.864177, lon: 30.319163, distance: 50, limit: 5)
                result?.stations?.forEach { print("Ближайшая станция: \($0.title ?? "Неизвестная станция")") }
            } catch {
                print("Failed to fetch nearest stations: \(error.localizedDescription)")
            }
        }
    }
    
    func getNearestSettlement() {
        Task {
            do {
                let result = try await scheduleService?.getNearestSettlement(lat: 59.864177, lon: 30.319163, distance: 50)
                print("Ближайший населенный пункт: \(result?.title ?? "Неизвестный населенный пункт")")
            } catch {
                print("Failed to fetch nearest settlement: \(error.localizedDescription)")
            }
        }
    }
    
    func getCarrierInfo() {
        Task {
            do {
                let result = try await scheduleService?.getCarrierInfo(code: 680)
                print("Перевозчик: \(result?.carrier?.title ?? "Неизвестный перевозчик")")
            } catch {
                print("Failed to fetch carrier info: \(error.localizedDescription)")
            }
        }
    }
    
    func getStationsList() {
        Task {
            do {
                let result = try await scheduleService?.getStationsList()
                if
                    let randomCountry = result?.countries?.randomElement(),
                    let randomRegion = randomCountry.regions?.randomElement(),
                    let randomSettlement = randomRegion.settlements?.randomElement(),
                    let stationsCount = randomSettlement.stations?.count {
                    print("Страна: \(randomCountry)\nРегион: \(randomRegion)\nГород: \(randomSettlement)\nКоличество станций: \(stationsCount)")
                }
            } catch {
                print("Сервер возвращает text/html вместо application/json. В файле openapi.yaml я могу поменять конфигурацию запроса на получение реального формата, но не совсем понятно, как обрабатывать получаемый в таком случае тип данных - HTTPBody. Уж не знаю, баг это или фича, что результат отличается от описанного в документации API.\nВот код ошибки: \(error.localizedDescription)")
            }
        }
    }
    
    func getCopyright() {
        Task {
            do {
                let result = try await scheduleService?.getCopyright()
                print("Копирайт: \(result?.text ?? "Информация недоступна")")
            } catch {
                print("Failed to fetch copyright data: \(error.localizedDescription)")
            }
        }
    }
}
