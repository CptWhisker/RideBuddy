//
//  AppState.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import Foundation

final class AppState: ObservableObject {
    
    @Published private(set) var selectedCarrier: CarrierModel?
}

// MARK: - Public Methods
extension AppState {
    
    func selectCarrier(_ carrier: CarrierModel) {
        selectedCarrier = carrier
    }
}
