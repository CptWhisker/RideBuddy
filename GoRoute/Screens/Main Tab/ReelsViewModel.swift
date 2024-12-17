//
//  StoriesViewModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 16.12.2024.
//

import SwiftUI
import Combine

final class ReelsViewModel: ObservableObject {
    
    // MARK: Properties
    @Published var timer: Timer.TimerPublisher = Timer.publish(every: 1.0, on: .main, in: .common)
    @Published var reelGroups = [ReelGroupModel]()
    @Published var currentReelIndex: Int = 0
    @Published var currentProgress: CGFloat = 0
    @Published var selectedReelGroup: ReelGroupModel? {
        didSet {
            resetReelProgress()
            resetTimer()
            addReelGroupToSeenList()
        }
    }
    
    private var groupsMarkedAsSeen = [ReelGroupModel]()
    private var timerConfiguration: TimerConfiguration { .init(storiesCount: selectedReelGroup?.reels.count ?? 0) }
    private var previousReelIndex: Int = 0
    private var timerCancellable: Cancellable?
    
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

// MARK: - Private Methods
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
    
    func resetTimer() {
        stopTimer()
        
        timer = Timer.publish(every: timerConfiguration.timerTickInterval, on: .main, in: .common)
        timerCancellable = timer.connect()
    }
    
    func proceedToNextReelGroup() {
        guard let currentGroup = selectedReelGroup,
              let currentIndex = reelGroups.firstIndex(of: currentGroup) else { return }
        
        let nextIndex = currentIndex + 1
        
        if nextIndex < reelGroups.count {
            selectReelGroup(reelGroups[nextIndex])
        } else if let firstGroup = reelGroups.first {
            selectReelGroup(firstGroup)
        }
    }
}

// MARK: - Public Methods
extension ReelsViewModel {
    
    func selectReelGroup(_ reelGroup: ReelGroupModel) {
        selectedReelGroup = reelGroup
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
        
        previousReelIndex = currentReelIndex
        
        if currentReelIndex < reels.count - 1 {
            currentReelIndex += 1
            resetTimer()
        } else {
            proceedToNextReelGroup()
        }
    }
    
    func updateCurrentReelIndex(newIndex: Int) {
        guard previousReelIndex != newIndex else { return }
        let progress = timerConfiguration.progress(for: newIndex)
        guard abs(progress - currentProgress) >= 0.01 else { return }
        currentProgress = progress
    }
    
    func updateReelProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        guard index != currentReelIndex else { return }
        currentReelIndex = index
    }
    
    func startTimer() {
        timer = Timer.publish(every: timerConfiguration.timerTickInterval, on: .main, in: .common)
        timerCancellable = timer.connect()
    }
    
    func stopTimer() {
        timerCancellable?.cancel()
    }
    
    func timerTick() {
        currentProgress = timerConfiguration.nextProgress(progress: currentProgress)
        
        if currentProgress >= 1.0 {
            proceedToNextReelGroup()
        }
    }
}
