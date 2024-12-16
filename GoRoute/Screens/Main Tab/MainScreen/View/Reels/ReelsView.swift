//
//  ReelsView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

struct ReelsView: View {
    
    @EnvironmentObject var reelsViewModel: ReelsViewModel
    @EnvironmentObject var coordinator: MainScreenCoordinator
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: LayoutProvider.Spacing.large) {
                ForEach(reelsViewModel.reelGroups) { reelGroup in
                    ReelPreview(reelGroup: reelGroup)
                        .onTapGesture {
                            handleReelGroupSelection(reelGroup)
                        }
                }
            }
            .padding(.horizontal, LayoutProvider.Padding.medium)
            .padding(.vertical, LayoutProvider.Padding.large)
        }
    }
}

// MARK: - Private Methods
private extension ReelsView {
    
    func handleReelGroupSelection(_ reelGroup: ReelGroupModel) {
        coordinator.navigateTo(.reelDetail(reelGroup: reelGroup))
        reelsViewModel.markReelGroupAsSeen(reelGroup)
    }
}

// MARK: - Preview
#Preview {
    let reelsViewModel = ReelsViewModel()
    
    ReelsView()
        .environmentObject(reelsViewModel)
}
