//
//  Date+Extensions.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import Foundation

// MARK: Formatting
extension Date {
    
    func formatted(by format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

// MARK: Calculations
extension Date {
    
    var timeInSecondsSinceStartOfDay: Int {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: self)
        return Int(self.timeIntervalSince(startOfDay))
    }
}
