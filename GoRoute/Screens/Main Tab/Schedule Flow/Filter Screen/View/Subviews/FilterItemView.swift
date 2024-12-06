//
//  FilterItemView.swift
//  GoRoute
//
//  Created by АAleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct FilterItemView: View {
    
    let title: String
    let imageName: String
    let onTap: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(ResourcesProvider.FontStyle.bodyText)
                .foregroundStyle(.accent)
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .frame(
                    width: LayoutProvider.Dimensions.General.checkBox,
                    height: LayoutProvider.Dimensions.General.checkBox
                )
                .foregroundStyle(.accent)
                .onTapGesture {
                    onTap()
                }
        }
        .frame(height: LayoutProvider.Dimensions.General.standardHeight)
    }
}

// MARK: - Preview
#Preview {
    FilterItemView(
        title: "Test Title",
        imageName: "rectangle",
        onTap: { print("Tap") }
    )
}
