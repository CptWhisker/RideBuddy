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
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            VStack(spacing: LayoutProvider.Spacing.extraLarge) {
                Image(image)
                
                Text(title)
                    .titleStyle()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ErrorView(image: .noInternet, title: "Нет интернета")
}
