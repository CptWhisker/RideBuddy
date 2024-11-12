//
//  MainScreenViewModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 12.11.2024.
//

import SwiftUI
import OpenAPIURLSession

protocol MainScreenViewModelProtocol: AnyObject {
    func getNearestStations()
}

final class MainScreenViewModel: ObservableObject {
    
    // MARK: - Properties
    private var client: Client?
    private let apiKey = "5412c04f-c459-4e7d-bc54-81dd504a1db6"
    
    // MARK: - Initialization
    init() {
        initializeClient()
    }
    
    // MARK: - Private Methods
    private func initializeClient() {
        do {
            client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
        } catch {
            print("Failed to create client with server URL: \(error.localizedDescription)")
        }
    }
}

// MARK: - Protocol Implementstion
extension MainScreenViewModel: MainScreenViewModelProtocol {
    
    func getNearestStations() {
        guard let client else { return }
        
        let service = NearestStationsService(
            client: client,
            apiKey: apiKey
        )
        
        Task {
            do {
                let stations = try await service.getNearestStations(lat: 59.864177, lon: 30.319163, distance: 50)
                stations.stations?.forEach { print("Новая станция: \($0.title ?? "Неизвестная станция")") }
            } catch {
                print("Failed to fetch nearest stations: \(error.localizedDescription)")
            }
        }
    }
}
