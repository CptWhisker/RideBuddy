//
//  CoordinatorProtocol.swift
//  GoRoute
//
//  Created by Aleksandr Mosovtsev on 05.12.2024.
//

import Foundation

protocol CoordinatorProtocol: ObservableObject {
    
    func navigateBack()
    func returnToRoot()
}
