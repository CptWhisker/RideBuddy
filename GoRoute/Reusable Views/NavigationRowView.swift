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
                    .bodyTextStyle(.accent)
                
                Spacer()
                
                Image(systemName: ResourcesProvider.Icon.navigationRowIcon)
            }
        }
        .frame(height: LayoutProvider.Dimensions.General.standardHeight)
    }
}

// MARK: - Preview
#Preview {
    NavigationRowView(title: "Test title", action: { print("Test action") })
}
