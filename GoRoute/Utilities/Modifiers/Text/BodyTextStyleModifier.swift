//
//  BodyTextStyleModifier.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

struct BodyTextStyleModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(ResourcesProvider.FontStyle.bodyText)
            .foregroundStyle(color)
    }
}
