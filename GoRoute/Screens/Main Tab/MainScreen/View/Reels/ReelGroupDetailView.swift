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
    
    @State private var dragOffset: CGFloat = .zero
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.appBlack
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                ReelsTabView()
                    .offset(y: dragOffset)
                    .opacity(LayoutProvider.Opacity.calculateOpacity(for: dragOffset))
                    .onChange(of: reelsViewModel.currentReelIndex) { newValue in
                        withAnimation {
                            reelsViewModel.updateCurrentReelIndex(newIndex: newValue)
                        }
                    }
                    .gesture(
                        DragToCloseGesture(
                            onDrag: { newOffset in
                                dragOffset = newOffset
                            },
                            onComplete: {
                                closeView()
                            },
                            onCancel: {
                                withAnimation {
                                    dragOffset = .zero
                                }
                            }
                        )
                    )
                    .onTapGesture { location in
                        handleTapGesture(at: location, in: geometry)
                    }
            }
            
            ReelsProgressBar()
                .onChange(of: reelsViewModel.currentProgress) { newValue in
                    withAnimation {
                        reelsViewModel.updateReelProgress(newProgress: newValue)
                    }
                }
            
            CloseButton() {
                closeView()
            }
        }
    }
}

// MARK: - Private Methods
private extension ReelGroupDetailView {
    
    func handleTapGesture(at location: CGPoint, in geometry: GeometryProxy) {
        let width = geometry.size.width
        if location.x < width / 2 {
            reelsViewModel.proceedToPreviousReel()
        } else {
            reelsViewModel.proceedToNextReel()
        }
    }
    
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
