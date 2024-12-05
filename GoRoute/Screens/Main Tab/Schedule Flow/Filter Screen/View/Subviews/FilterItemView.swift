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
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.accent)
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.accent)
                .onTapGesture {
                    onTap()
                }
        }
        .frame(height: 60)
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
