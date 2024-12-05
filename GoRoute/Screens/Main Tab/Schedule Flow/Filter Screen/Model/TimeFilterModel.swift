//
//  TimeFilterOption.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import Foundation

enum TimeFilterModel: String, CaseIterable, FilterProtocol {
    
    case morning = "Утро 6:00 - 12:00"
    case day = "День 12:00 - 18:00"
    case evening = "Вечер 18:00 - 00:00"
    case night = "Ночь 00:00 - 6:00"
    
    var label: String { rawValue }
    var id: String { rawValue }
}

// MARK: - Calculations
extension TimeFilterModel {
    
    var timePeriod: (start: Int, end: Int) {
        switch self {
            
        case .morning:
            return (start: 6 * 3600, end: 12 * 3600)
        case .day:
            return (start: 12 * 3600, end: 18 * 3600)
        case .evening:
            return (start: 18 * 3600, 24 * 3600)
        case .night:
            return (start: 0, end: 6 * 3600)
        }
    }
}
