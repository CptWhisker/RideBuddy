//
//  ReelsViewModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 16.12.2024.
//

import SwiftUI
import Combine

final class ReelsViewModel: ObservableObject {
    
    // MARK: Properties
    @AppStorage("savedReelGroups") var storedReelGroups: Data?
    
    @Published private(set) var reelGroups = [ReelGroupModel]()
    @Published private(set) var currentReelIndex: Int = 0
    @Published private(set) var currentProgress: CGFloat = 0
    @Published var selectedReelGroup: ReelGroupModel?
    
    private var cancellables = Set<AnyCancellable>()
    private let timerManager: TimerManager
    private var groupsMarkedAsSeen = [ReelGroupModel]()
    private var timerConfiguration: TimerConfiguration { .init(storiesCount: selectedReelGroup?.reels.count ?? 0) }
    private var previousReelIndex: Int = 0
    
    // MARK: Initialization
    init(timerManager: TimerManager = TimerManager()) {
        self.timerManager = timerManager
        
        makeSubscriptions()
        getReels()
    }
}

// MARK: - Data Management
private extension ReelsViewModel {
    
    func getReels() {
        guard let storedReelGroups else {
            reelGroups = MockDataProvider.mockReelGroups
            return
        }
        
        do {
            reelGroups = try JSONDecoder().decode([ReelGroupModel].self, from: storedReelGroups)
        } catch {
            print("Error decoding reel groups: \(error)")
            reelGroups = MockDataProvider.mockReelGroups
        }
    }
    
    func saveReelsToStorage() {
        do {
            let data = try JSONEncoder().encode(reelGroups)
            storedReelGroups = data
        } catch {
            print("Error saving reel groups: \(error)")
        }
    }
}

// MARK: - Subscriptions
private extension ReelsViewModel {
    
    func makeSubscriptions() {
        makeReelGroupsSubscription()
        makeSelectedReelGroupSubscription()
    }
    
    func makeReelGroupsSubscription() {
        $reelGroups
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                
                self.saveReelsToStorage()
            }
            .store(in: &cancellables)
    }
    
    func makeSelectedReelGroupSubscription() {
        $selectedReelGroup
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }

                self.resetReelProgress()
                self.addReelGroupToSeenList()
                self.resetTimer()
            }
            .store(in: &cancellables)
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
    
    func resetTimer() {
        timerManager.start(with: timerConfiguration.timerTickInterval) { [weak self] in
            self?.timerTick()
        }
    }
    
    func timerTick() {
        currentProgress = timerConfiguration.nextProgress(progress: currentProgress)
        
        if currentProgress >= 1.0 {
            proceedToNextReelGroup()
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
    
    func proceedToPreviousReel() {
        if currentReelIndex > 0 {
            updateCurrentReelIndex(newIndex: currentReelIndex - 1, backwards: true)
        }
    }
    
    func updateCurrentReelIndex(newIndex: Int, backwards: Bool = false) {
        guard backwards || previousReelIndex != newIndex else { return }
        
        let progress = timerConfiguration.progress(for: newIndex)
        guard abs(progress - currentProgress) >= 0.01 else { return }
        
        currentProgress = progress
        previousReelIndex = newIndex
    }
    
    func updateReelProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        guard index != currentReelIndex else { return }
        currentReelIndex = index
    }
}
