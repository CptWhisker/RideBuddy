//
//  ReelSingleView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 16.12.2024.
//

import SwiftUI

struct ReelSingleView: View {
    
    let reel: ReelModel
    
    var body: some View {
        Image(reel.contentImage)
            .reelStyle()
            .overlay(textOverlay)
    }
}

// MARK: - Subviews
private extension ReelSingleView {
    
    var textOverlay: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: LayoutProvider.Spacing.large) {
                Text(reel.title)
                    .reelTitleStyle()
                
                Text(reel.description)
                    .reelDescriptionStyle()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(
                .init(
                    top: LayoutProvider.Padding.ReelText.top,
                    leading: LayoutProvider.Padding.ReelText.horizontal,
                    bottom: LayoutProvider.Padding.ReelText.bottom,
                    trailing: LayoutProvider.Padding.ReelText.horizontal
                )
            )
        }
    }
}

// MARK: - Preview
#Preview {
    ReelSingleView(
        reel: ReelModel(
            contentImage: .reelBig11,
            title: "Title",
            description: "Description"
        )
    )
}
