//
//  ReelsProgressBar.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 17.12.2024.
//

import SwiftUI

struct ReelsProgressBar: View {
    
    @EnvironmentObject var reelsViewModel: ReelsViewModel

    var body: some View {
        ProgressBar(
            numberOfSections: reelsViewModel.selectedReelGroup?.reels.count ?? 0,
            progress: reelsViewModel.currentProgress
        )
        .padding(
            .init(
                top: LayoutProvider.Padding.ProgressBar.top,
                leading: LayoutProvider.Padding.ProgressBar.horizontal,
                bottom: LayoutProvider.Padding.ProgressBar.bottom,
                trailing: LayoutProvider.Padding.ProgressBar.horizontal
            )
        )
    }
}
