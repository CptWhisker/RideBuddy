//
//  NearestStationsService.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 12.11.2024.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestStations = Components.Schemas.Stations

protocol NearestStationsServiceProtocol {
    func getNearestStations(lat: Double, lon: Double, distance: Int) async throws -> NearestStations
}

final class NearestStationsService: NearestStationsServiceProtocol {
    
    private let client: Client
    private let apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getNearestStations(lat: Double, lon: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(
            query: .init(
                apikey: apiKey,
                lat: lat,
                lng: lon,
                distance: distance
            )
        )
        
        return try response.ok.body.json
    }
}
