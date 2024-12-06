//
//  Text+Extensions.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

extension Text {
    
    func titleStyle() -> some View {
        self.modifier(TitleStyleModifier())
    }
    
    func bodyTextStyle(_ color: Color) -> some View {
        self.modifier(BodyTextStyleModifier(color: color))
    }

    func captionTextStyle(_ color: Color) -> some View {
        self.modifier(CaptionTextStyleModifier(color: color))
    }
    
    func copyrightStyle() -> some View {
        self
            .captionTextStyle(.accent)
            .multilineTextAlignment(.center)
            .lineSpacing(LayoutProvider.Spacing.extraLarge)
            .padding(.bottom, LayoutProvider.Padding.large)
    }
}
