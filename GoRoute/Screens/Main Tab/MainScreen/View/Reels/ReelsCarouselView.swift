//
//  ReelsCarouselView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

struct ReelsCarouselView: View {
    
    @EnvironmentObject var reelsViewModel: ReelsViewModel
    @EnvironmentObject var coordinator: MainScreenCoordinator
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: LayoutProvider.Spacing.large) {
                ForEach(reelsViewModel.reelGroups) { reelGroup in
                    ReelThumbnail(reelGroup: reelGroup)
                        .onTapGesture {
                            selectReelGroup(reelGroup)
                        }
                }
            }
            .padding(.horizontal, LayoutProvider.Padding.medium)
            .padding(.vertical, LayoutProvider.Padding.large)
        }
    }
}

// MARK: - Private Methods
private extension ReelsCarouselView {
    
    func selectReelGroup(_ reelGroup: ReelGroupModel) {
        reelsViewModel.selectReelGroup(reelGroup)
        coordinator.navigateTo(.reelDetail(reelGroup: reelGroup))
    }
}

// MARK: - Preview
#Preview {
    let reelsViewModel = ReelsViewModel()
    
    ReelsCarouselView()
        .environmentObject(reelsViewModel)
}
