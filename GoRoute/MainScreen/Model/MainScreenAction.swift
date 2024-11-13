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
    
    func performAction(on viewModel: MainScreenViewModelProtocol) {
        switch self {
        case .scheduleBetweenStations: viewModel.getScheduleBetweenStations()
        case .scheduleFromStation: viewModel.getScheduleFromStation()
        case .stationsForThread: viewModel.getStationsForThread()
        case .nearestStations: viewModel.getNearestStations()
        case .nearestSettlement: viewModel.getNearestSettlement()
        case .carrierInfo: viewModel.getCarrierInfo()
        case .stationsList: viewModel.getStationsList()
        case .copyright: viewModel.getCopyright()
        }
    }
}

extension MainScreenAction: Identifiable {
    
    var id: String { rawValue }
}
