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
    @Published var currentReelIndex: Int = 0
    @Published var currentProgress: CGFloat = 0
    @Published var selectedReelGroup: ReelGroupModel? {
        didSet {
            addReelGroupToSeenList()
        }
    }
    
    private var groupsMarkedAsSeen = [ReelGroupModel]()
    private var timerConfiguration: TimerConfiguration { .init(storiesCount: selectedReelGroup?.reels.count ?? 0) }
    
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

// MARK: Private Methods
private extension ReelsViewModel {
 
    func resetReelProgress() {
        currentReelIndex = 0
        currentProgress = 0
    }
    
    func addReelGroupToSeenList() {
        guard let selectedReelGroup else { return }
        
        if !groupsMarkedAsSeen.contains(selectedReelGroup) {
            groupsMarkedAsSeen.append(selectedReelGroup)
        }
    }
}

// MARK: Public Methods
extension ReelsViewModel {
    
    func selectReelGroup(_ reelGroup: ReelGroupModel) {
        selectedReelGroup = reelGroup
        resetReelProgress()
    }
    
    func markGroupsAsSeen() {
        for reelGroup in groupsMarkedAsSeen {
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
        
        groupsMarkedAsSeen.removeAll()
    }
    
    func proceedToNextReel() {
        guard let reels = selectedReelGroup?.reels else { return }
        
        currentReelIndex = min(currentReelIndex + 1, reels.count - 1)
    }
    
    func updateCurrentReelIndex(oldIndex: Int, newIndex: Int) {
        guard oldIndex != newIndex else { return }
        let progress = timerConfiguration.progress(for: newIndex)
        guard abs(progress - currentProgress) >= 0.01 else { return }
        currentProgress = progress
    }
    
    func updateReelProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        guard index != currentReelIndex else { return }
        currentReelIndex = index
    }
}
