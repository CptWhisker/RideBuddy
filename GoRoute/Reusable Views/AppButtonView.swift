//
//  AppButtonView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import SwiftUI

struct AppButtonView: View {
    
    let title: String
    let dimensions: CGSize
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 17, weight: .bold))
        }
        .frame(width: dimensions.width, height: dimensions.height)
        .background(.appBlue)
        .foregroundStyle(.appWhite)
        .clipShape(.rect(cornerRadius: 16))
    }
}

#Preview {
    AppButtonView(
        title: "Test Title",
        dimensions: CGSize(width: 150, height: 60),
        action: { print("AppButton tapped") }
    )
}
