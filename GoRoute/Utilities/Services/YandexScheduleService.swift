//
//  YandexScheduleService.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 13.11.2024.
//

import OpenAPIRuntime
import OpenAPIURLSession

// MARK: - Typealias
typealias Segment = Components.Schemas.Segment
typealias ScheduleResponse = Components.Schemas.ScheduleResponse
typealias ThreadResponse = Components.Schemas.ThreadResponse
typealias NearestStations = Components.Schemas.Stations
typealias NearestSettlement = Components.Schemas.Settlement
typealias Carrier = Components.Schemas.Carriers
typealias Countries = Components.Schemas.StationsListResponse
typealias Copyright = Components.Schemas.Copyright

// MARK: - Protocol
protocol YandexScheduleServiceProtocol {
    func getScheduleBetweenStations(stationFrom: String, stationTo: String) async throws -> [Segment]?
    func getScheduleFromStation(station: String) async throws -> ScheduleResponse
    func getStationsForThread(threadID: String) async throws -> ThreadResponse
    func getNearestStations(lat: Double, lon: Double, distance: Int, limit: Int) async throws -> NearestStations
    func getNearestSettlement(lat: Double, lon: Double, distance: Int) async throws -> NearestSettlement
    func getCarrierInfo(code: Int) async throws -> Carrier
    func getStationsList() async throws -> Countries
    func getCopyright() async throws -> Copyright?
}

final class YandexScheduleService {
    
    // MARK: Properties
    private let client: Client
    private let apiKey: String
    
    // MARK: Initialization
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
}

// MARK: - Protocol Implementation
extension YandexScheduleService: YandexScheduleServiceProtocol {
    
    func getScheduleBetweenStations(stationFrom: String, stationTo: String) async throws -> [Segment]? {
        let response = try await client.getScheduleBetweenStations(
            query: .init(
                apikey: apiKey,
                from: stationFrom,
                to: stationTo,
                limit: 1
            )
        )
        
        return try response.ok.body.json.segments
    }
    
    func getScheduleFromStation(station: String) async throws -> ScheduleResponse {
        let response = try await client.getScheduleFromStation(
            query: .init(
                apikey: apiKey,
                station: station
            )
        )
        
        return try response.ok.body.json
    }
    
    func getStationsForThread(threadID: String) async throws -> ThreadResponse {
        let response = try await client.getStationsForThread(
            query: .init(
                apikey: apiKey,
                uid: threadID
            )
        )
        
        return try response.ok.body.json
    }
    
    func getNearestStations(lat: Double, lon: Double, distance: Int, limit: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(
            query: .init(
                apikey: apiKey,
                lat: lat,
                lng: lon,
                distance: distance,
                limit: limit
            )
        )
        
        return try response.ok.body.json
    }
    
    func getNearestSettlement(lat: Double, lon: Double, distance: Int) async throws -> NearestSettlement {
        let response = try await client.getNearestSettlement(
            query: .init(
                apikey: apiKey,
                lat: lat,
                lng: lon,
                distance: distance
            )
        )
        
        return try response.ok.body.json
    }
    
    func getCarrierInfo(code: Int) async throws -> Carrier {
        let response = try await client.getCarrierInfo(
            query: .init(
                apikey: apiKey,
                code: code
            )
        )
        
        return try response.ok.body.json
    }
    
    func getStationsList() async throws -> Countries {
        let response = try await client.getStationsList(
            query: .init(
                apikey: apiKey
            )
        )
        
        return try response.ok.body.json
    }
    
    func getCopyright() async throws -> Copyright? {
        let response = try await client.getCopyright(
            query: .init(
                apikey: apiKey
            )
        )
        
        return try response.ok.body.json.copyright
    }
}
