//
//  Rectangle+Extensions.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

extension Rectangle {
    
    func lineStyle() -> some View {
        self.modifier(RectangleLineStyleModifier())
    }
    
    func mockReelStyle() -> some View {
        self
            .fill(Color.accent)
            .clipShape(RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.small))
            .overlay {
                RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.small)
                    .strokeBorder(
                        Color.appBlue,
                        lineWidth: LayoutProvider.BorderWidth.large
                    )
            }
            .frame(
                width: LayoutProvider.Dimensions.Reel.width,
                height: LayoutProvider.Dimensions.Reel.height
            )
    }
}
