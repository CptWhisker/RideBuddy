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
}
