//
//  ReelsTabView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 17.12.2024.
//

import SwiftUI

struct ReelsTabView: View {
    
    @EnvironmentObject var reelsViewModel: ReelsViewModel
    
    var body: some View {
        TabView(selection: $reelsViewModel.selectedReelGroup) {
            ForEach(reelsViewModel.reelGroups.indices, id: \.self) { groupIndex in
                let reelGroup = reelsViewModel.reelGroups[groupIndex]
                ReelSingleView(reel: reelGroup.reels[reelsViewModel.currentReelIndex])
                    .tag(reelGroup)
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

// MARK: - Preview
#Preview {
    let reelsViewModel = ReelsViewModel()
    
    ReelsTabView()
        .environmentObject(reelsViewModel)
}
