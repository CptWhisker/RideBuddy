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
    let dimensions: CGSize
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 4) {
                Text(title)
                    .font(.system(size: 17, weight: .bold))
                
                if isPresented {
                    Circle()
                        .frame(width: 8)
                        .foregroundStyle(.appRed)
                }
            }
        }
        .frame(width: dimensions.width, height: dimensions.height)
        .background(.appBlue)
        .foregroundStyle(.appWhite)
        .clipShape(.rect(cornerRadius: 16))
    }
}

// MARK: - Preview
#Preview {
    AppButtonView(
        isPresented: .constant(true),
        title: "Test Title",
        dimensions: CGSize(width: 150, height: 60),
        action: { print("AppButton tapped") }
    )
}
