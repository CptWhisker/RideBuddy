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
            .overlay(alignment: .bottom) {
                textOverlay
            }
    }
}

// MARK: - Subviews
private extension ReelSingleView {
    
    var textOverlay: some View {
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

// MARK: - Preview
#Preview {
    ReelSingleView(
        reel: ReelModel(
            contentImage: ResourcesProvider.ReelGroup.Reel1.reelImage1,
            title: "Title",
            description: "Description"
        )
    )
}
