//
//  ReelsView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

struct ReelsView: View {
    
    @EnvironmentObject var reelsViewModel: ReelsViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: LayoutProvider.Spacing.large) {
                ForEach(reelsViewModel.reelGroups) { reelGroup in
                    Image(reelGroup.thumbnail)
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: LayoutProvider.Dimensions.Reel.width,
                            height: LayoutProvider.Dimensions.Reel.height
                        )
                        .clipShape(RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.small))
                        .opacity(reelGroup.isSeen ? LayoutProvider.Opacity.halfVisible : LayoutProvider.Opacity.visible)
                        .overlay {
                            if !reelGroup.isSeen {
                                RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.small)
                                    .strokeBorder(
                                        Color.appBlue,
                                        lineWidth: LayoutProvider.BorderWidth.large
                                    )
                            }
                        }
                        .onTapGesture {
                            reelsViewModel.markReelGroupAsSeen(reelGroup)
                        }
                }
            }
            .padding(.horizontal, LayoutProvider.Padding.medium)
            .padding(.vertical, LayoutProvider.Padding.large)
        }
    }
}

// MARK: - Preview
#Preview {
    let reelsViewModel = ReelsViewModel()
    
    ReelsView()
        .environmentObject(reelsViewModel)
}
