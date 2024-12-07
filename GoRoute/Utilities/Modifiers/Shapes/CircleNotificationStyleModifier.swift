//
//  CircleNotificationStyleModifier.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

struct CircleNotificationStyleModifier: ViewModifier {
        
    func body(content: Content) -> some View {
        content
            .frame(width: LayoutProvider.Dimensions.General.badge)
            .foregroundStyle(.appRed)
    }
}
