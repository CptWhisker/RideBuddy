//
//  MainScreenAction.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 14.11.2024.
//

import Foundation

enum MainScreenAction: String, CaseIterable {
    
    case scheduleBetweenStations = "Расписание рейсов между станциями"
    case scheduleFromStation = "Расписание рейсов по станции"
    case stationsForThread = "Список станций следования"
    case nearestStations = "Список ближайших станций"
    case nearestSettlement = "Ближайший город"
    case carrierInfo = "Информация о перевозчике"
    case stationsList = "Список всех доступных станций"
    case copyright = "Копирайт Яндекс Расписаний"
    
    var errorDescription: String {
        switch self {
            
        case .scheduleBetweenStations:
            return "Unable to retrieve schedule between the specified stations."
        case .scheduleFromStation:
            return "Unable to retrieve schedule for the specified station."
        case .stationsForThread:
            return "Unable to retrieve station list for the specified thread."
        case .nearestStations:
            return "Unable to retrieve nearby stations."
        case .nearestSettlement:
            return "Unable to retrieve the nearest settlement information."
        case .carrierInfo:
            return "Unable to retrieve information about the carrier."
        case .stationsList:
            return "Unable to retrieve the complete station list."
        case .copyright:
            return "Unable to retrieve copyright information."
        }
    }
    
    func performAction(on viewModel: MainScreenViewModelProtocol) async throws {
        switch self {
            
        case .scheduleBetweenStations: try await viewModel.getScheduleBetweenStations()
        case .scheduleFromStation: try await viewModel.getScheduleFromStation()
        case .stationsForThread: try await viewModel.getStationsForThread()
        case .nearestStations: try await viewModel.getNearestStations()
        case .nearestSettlement: try await viewModel.getNearestSettlement()
        case .carrierInfo: try await viewModel.getCarrierInfo()
        case .stationsList: try await viewModel.getStationsList()
        case .copyright: try await viewModel.getCopyright()
        }
    }
}

extension MainScreenAction: Identifiable {
    
    var id: String { rawValue }
}
