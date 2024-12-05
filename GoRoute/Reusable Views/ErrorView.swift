//
//  ErrorView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import SwiftUI

struct ErrorView: View {
    
    let image: ImageResource
    let title: String
    
    var body: some View {
        VStack(spacing: 16) {
            Image(image)
            
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.accent)
        }
    }
}

// MARK: - Preview
#Preview {
    ErrorView(image: .noInternet, title: "Нет интернета")
}
