//
//  FontProvider.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

enum ResourcesProvider {
    
    enum FontStyle {
        static let title: Font = Font.system(size: 24, weight: .bold)
        static let buttonLabel: Font = .system(size: 17, weight: .bold)
        static let bodyText: Font = .system(size: 17, weight: .regular)
        static let captionText: Font = .system(size: 12, weight: .regular)
    }
    
    enum Icon {
        static let navigationBackButton: String = "chevron.left"
        static let navigationRowIcon: String = "chevron.right"
        static let changeButton: String = "arrow.2.squarepath"
        static let mainTabIcon: String = "arrow.up.message"
        static let settingsTabIcon: String = "gearshape"
        static let emptyRectCheckbox: String = "square"
        static let markedRectCheckbox: String = "checkmark.square"
        static let emptyCircleCheckbox: String = "circle"
        static let markedCircleCheckbox: String = "record.circle"
    }
}
