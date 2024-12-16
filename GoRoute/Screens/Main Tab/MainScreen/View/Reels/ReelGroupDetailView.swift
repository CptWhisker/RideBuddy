//
//  ReelGroupDetailView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 16.12.2024.
//

import SwiftUI

struct ReelGroupDetailView: View {
    
    @EnvironmentObject var reelsViewModel: ReelsViewModel
    @EnvironmentObject var coordinator: MainScreenCoordinator
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.appBlack
                .ignoresSafeArea()
            
            ReelsTabView()
                .onTapGesture {
                    reelsViewModel.proceedToNextReel()
                }
            
            CloseButton(action: { closeView() })
                .padding(.top, LayoutProvider.Padding.CLoseButton.top)
                .padding(.trailing, LayoutProvider.Padding.CLoseButton.trailing)
        }
    }
}

// MARK: - Private Methods
private extension ReelGroupDetailView {
    
    func closeView() {
        reelsViewModel.markGroupsAsSeen()
        coordinator.navigateBack()
    }
}

// MARK: - Preview
#Preview {
    let reelsViewModel = ReelsViewModel()
    let coordinator = MainScreenCoordinator()
    
    ReelGroupDetailView()
        .environmentObject(reelsViewModel)
        .environmentObject(coordinator)
}
