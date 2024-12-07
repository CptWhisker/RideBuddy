//
//  Circle+Extensions.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

extension Circle {
    
    func notificationStyle() -> some View {
        self.modifier(CircleNotificationStyleModifier())
    }
}
