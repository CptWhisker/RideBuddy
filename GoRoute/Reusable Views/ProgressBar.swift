//
//  ProgressBar.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 17.12.2024.
//

import SwiftUI

struct ProgressBar: View {
    let numberOfSections: Int
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.progressBar)
                    .frame(width: geometry.size.width, height: LayoutProvider.Dimensions.ProgressBar.height)
                    .foregroundColor(.white)
                
                RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.progressBar)
                    .frame(
                        width: min(
                            progress * geometry.size.width,
                            geometry.size.width
                        ),
                        height: LayoutProvider.Dimensions.ProgressBar.height
                    )
                    .foregroundColor(.appBlue)
            }
            .mask(maskView(numberOfSections: numberOfSections))
        }
    }
}

// MARK: - Subviews
private extension ProgressBar {
    
    private func maskView(numberOfSections: Int) -> some View {
        HStack {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                maskFragmentView
            }
        }
    }
    
    private var maskFragmentView: some View {
        RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.progressBar)
            .fixedSize(horizontal: false, vertical: true)
            .frame(height: LayoutProvider.Dimensions.ProgressBar.height)
            .foregroundStyle(.white)
    }
}

// MARK: - Preview
#Preview {
    Color.appBlack
        .ignoresSafeArea()
        .overlay(
            ProgressBar(numberOfSections: 5, progress: 0.5)
                .padding()
        )
}
