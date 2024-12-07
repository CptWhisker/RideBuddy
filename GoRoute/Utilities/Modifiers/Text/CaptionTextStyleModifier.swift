//
//  CaptionTextStyleModifier.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

struct CaptionTextStyleModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(ResourcesProvider.FontStyle.captionText)
            .foregroundStyle(color)
    }
}
