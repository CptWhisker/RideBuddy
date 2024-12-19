//
//  AppState.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 07.12.2024.
//

import Foundation

// MARK: - States
enum ErrorState {
    case none, noInternet, serverError
}

// MARK: - AppState
final class AppState: ObservableObject {
        
    @Published var errorState: ErrorState = .none
    
    var iOS18OrLater: Bool {
        if #available(iOS 18.0, *) {
            return true
        }
        return false
    }
}

// MARK: - Public Methods
extension AppState {
    
    func setErrorState(_ state: ErrorState) {
        errorState = state
    }
}
