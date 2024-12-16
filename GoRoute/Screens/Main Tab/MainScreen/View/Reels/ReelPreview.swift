//
//  ReelPreview.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 16.12.2024.
//

import SwiftUI

struct ReelPreview: View {
    
    let reelGroup: ReelGroupModel
    
    var body: some View {
        Image(reelGroup.thumbnail)
            .reelPreviewStyle(isSeen: reelGroup.isSeen)
            .overlay(alignment: .bottom) {
                Text(reelGroup.description)
                    .font(ResourcesProvider.FontStyle.captionText)
                    .foregroundStyle(.appWhite)
                    .lineLimit(ResourcesProvider.TextLineLimit.reelDescription)
                    .padding(.bottom, LayoutProvider.Padding.semiSmall)
                    .padding(.horizontal, LayoutProvider.Padding.small)
            }
    }
}

// MARK: - Preview
#Preview {
    ReelPreview(
        reelGroup: ReelGroupModel(
            thumbnail: .reelPreview1,
            reels: []
        )
    )
}
