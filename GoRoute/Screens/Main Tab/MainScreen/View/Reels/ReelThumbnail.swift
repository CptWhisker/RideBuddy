//
//  ReelThumbnail.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 16.12.2024.
//

import SwiftUI

struct ReelThumbnail: View {
    
    let reelGroup: ReelGroupModel
    
    var body: some View {
        Image(reelGroup.thumbnail)
            .reelThumbnailStyle(isSeen: reelGroup.isSeen)
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
    ReelThumbnail(
        reelGroup: ReelGroupModel(
            thumbnail: ResourcesProvider.ReelGroup.Reel1.thumbnailImage,
            reels: []
        )
    )
}
