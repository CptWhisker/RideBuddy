//
//  RectangleLineStyleModifier.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

struct RectangleLineStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.appGray)
            .frame(height: LayoutProvider.Dimensions.General.line)
    }
}
