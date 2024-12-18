//
//  AppButtonView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import SwiftUI

struct AppButtonView: View {
    
    @Binding var isNotificationPresented: Bool
    
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
                
                Circle()
                    .notificationStyle()
                    .opacity(
                        isNotificationPresented ?
                        LayoutProvider.Opacity.visible : LayoutProvider.Opacity.invisible
                    )
            }
        }
        .appButtonStandardStyle(width: width)
    }
}

// MARK: - Preview
#Preview {
    AppButtonView(
        isNotificationPresented: .constant(true),
        title: "Test Title",
        width: LayoutProvider.Dimensions.Button.appSmallWidth,
        action: { print("AppButton tapped") }
    )
}
