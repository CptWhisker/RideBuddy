//
//  CoordinatorProtocol.swift
//  GoRoute
//
//  Created by Aleksandr Mosovtsev on 05.12.2024.
//

import SwiftUI

protocol CoordinatorProtocol: ObservableObject {
    
    associatedtype Destination
    
    var path: NavigationPath { get set }
    
    func navigateTo(_ destination: Destination)
    func navigateBack()
    func returnToRoot()
}

// MARK: - Default Implementation
extension CoordinatorProtocol {
    
    func navigateTo(_ destination: Destination) where Destination: Hashable {
        path.append(destination)
    }

    func navigateBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func returnToRoot() {
        prepareForRootReset()
        resetPath()
    }
    
    func resetPath() {
        path = NavigationPath()
    }
    
    func prepareForRootReset() {}
}
