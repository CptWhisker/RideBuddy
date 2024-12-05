//
//  PlaceholderTextView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct PlaceholderTextView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.accent)
    }
}

// MARK: - Preview
#Preview {
    PlaceholderTextView(
        title: "Test"
    )
}
