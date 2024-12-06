//
//  Button+Extensions.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

extension Button {
    
    func appButtonStandardStyle(width: CGFloat) -> some View {
        self
            .frame(
                width: width,
                height: LayoutProvider.Dimensions.General.standardHeight
            )
            .background(.appBlue)
            .foregroundStyle(.appWhite)
            .clipShape(.rect(cornerRadius: LayoutProvider.CornerRadius.small))
    }
    
    func routeCardStandardStyle() -> some View {
        self
            .frame(
                width: LayoutProvider.Dimensions.General.standardWidth,
                height: LayoutProvider.Dimensions.RouteCard.height
            )
            .background(.appLightGray)
            .clipShape(.rect(cornerRadius: LayoutProvider.CornerRadius.large))
    }
}
