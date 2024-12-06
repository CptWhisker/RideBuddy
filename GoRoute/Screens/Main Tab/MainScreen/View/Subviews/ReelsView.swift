//
//  ReelsView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

struct ReelsView: View {
    
    let reels: [ReelModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: LayoutProvider.Spacing.large) {
                ForEach(reels) { _ in
                    Rectangle()
                        .fill(Color.accent)
                        .clipShape(RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.small))
                        .overlay {
                            RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.small)
                                .strokeBorder(
                                    Color.appBlue,
                                    lineWidth: LayoutProvider.BorderWidth.large
                                )
                        }
                        .frame(
                            width: LayoutProvider.Dimensions.Reel.width,
                            height: LayoutProvider.Dimensions.Reel.height
                        )
                }
            }
            .padding(.horizontal, LayoutProvider.Padding.medium)
            .padding(.vertical, LayoutProvider.Padding.large)
        }
    }
}

// MARK: - Preview
#Preview {
    ReelsView(reels: Array(repeating: ReelModel(), count: 10))
}
