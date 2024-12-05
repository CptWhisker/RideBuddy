//
//  CellView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import SwiftUI

struct NavigationRowView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(.accent)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.accent)
            }
        }
        .frame(height: 60)
    }
}

// MARK: - Preview
#Preview {
    NavigationRowView(title: "Test title", action: { print("Test action") })
}
