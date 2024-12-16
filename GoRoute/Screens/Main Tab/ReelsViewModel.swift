//
//  StoriesViewModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 16.12.2024.
//

import Foundation

final class ReelsViewModel: ObservableObject {
    
    // MARK: Properties
    @Published var reelGroups = [ReelGroupModel]()
    
    // MARK: Initialization
    init() {
        getReels()
    }
}

// MARK: - Data Management
private extension ReelsViewModel {
    
    func getReels() {
        reelGroups = MockDataProvider.mockReelGroups
    }
}

// MARK: Public Methods
extension ReelsViewModel {
    
    func markReelGroupAsSeen(_ reelGroup: ReelGroupModel) {
        if let reelGroupIndex = reelGroups.firstIndex(of: reelGroup) {
            reelGroups[reelGroupIndex].isSeen = true
            let seenReelGroup = reelGroups.remove(at: reelGroupIndex)
            if let seenStartIndex = reelGroups.firstIndex(where: { $0.isSeen }) {
                reelGroups.insert(seenReelGroup, at: seenStartIndex)
            } else {
                reelGroups.append(seenReelGroup)
            }
        }
    }
}
