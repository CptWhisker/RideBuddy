//
//  Image+Extensions.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

extension Image {
    
    func checkboxStyle() -> some View {
        self
            .resizable()
            .frame(
                width: LayoutProvider.Dimensions.General.checkBox,
                height: LayoutProvider.Dimensions.General.checkBox
            )
            .foregroundStyle(.accent)
    }
    
    func changeButtonStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(
                width: LayoutProvider.Dimensions.General.icon,
                height: LayoutProvider.Dimensions.General.icon
            )
            .foregroundStyle(.appBlue)
            .fontWeight(.bold)
            .frame(
                width: LayoutProvider.Dimensions.Button.changeButton,
                height: LayoutProvider.Dimensions.Button.changeButton
            )
            .background(.appWhite, in: Circle())
    }
    
    func carrierThumbnailStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(
                width: LayoutProvider.Dimensions.Carrier.logo,
                height: LayoutProvider.Dimensions.Carrier.logo
            )
    }
    
    func carrierLogoStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
    }
    
    func reelThumbnailStyle(isSeen: Bool) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(
                width: LayoutProvider.Dimensions.Reel.width,
                height: LayoutProvider.Dimensions.Reel.height
            )
            .clipShape(RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.small))
            .opacity(isSeen ? LayoutProvider.Opacity.halfVisible : LayoutProvider.Opacity.visible)
            .overlay {
                if !isSeen {
                    RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.small)
                        .strokeBorder(
                            Color.appBlue,
                            lineWidth: LayoutProvider.BorderWidth.large
                        )
                }
            }
    }
    
    func reelStyle() -> some View {
        self
            .resizable()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.extraLarge))
            .padding(
                .init(
                    top: LayoutProvider.Padding.Reel.top,
                    leading: LayoutProvider.Padding.Reel.horizontal,
                    bottom: LayoutProvider.Padding.Reel.bottom,
                    trailing: LayoutProvider.Padding.Reel.horizontal
                )
            )
    }
}
