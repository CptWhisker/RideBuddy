//
//  AppButtonView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import SwiftUI

struct AppButtonView: View {
    
    @Binding var isPresented: Bool
    
    let title: String
    let width: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: LayoutProvider.Spacing.small) {
                Text(title)
                    .font(ResourcesProvider.FontStyle.buttonLabel)
                
                if isPresented {
                    Circle()
                        .frame(width: LayoutProvider.Dimensions.General.badge)
                        .foregroundStyle(.appRed)
                }
            }
        }
        .frame(
            width: width,
            height: LayoutProvider.Dimensions.General.standardHeight
        )
        .background(.appBlue)
        .foregroundStyle(.appWhite)
        .clipShape(.rect(cornerRadius: LayoutProvider.CornerRadius.small))
    }
}

// MARK: - Preview
#Preview {
    AppButtonView(
        isPresented: .constant(true),
        title: "Test Title",
        width: LayoutProvider.Dimensions.Button.appSmallWidth,
        action: { print("AppButton tapped") }
    )
}
