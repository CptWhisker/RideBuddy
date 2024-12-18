//
//  MainNavigationModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import Foundation

enum MainNavigationModel {
    case reelDetail(reelGroup: ReelGroupModel)
    case cityList
    case stationList
    case routeList
    case filterScreen
    case carrierDetails
}

// MARK: - Identifiable
extension MainNavigationModel: Identifiable {
    
    var id: String { String(describing: self) }
}

// MARK: - Equatable
extension MainNavigationModel: Equatable {
    
    static func == (lhs: MainNavigationModel, rhs: MainNavigationModel) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Hashable
extension MainNavigationModel: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
