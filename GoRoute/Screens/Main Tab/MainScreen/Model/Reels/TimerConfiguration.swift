//
//  TimerConfiguration.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 16.12.2024.
//

import Foundation

struct TimerConfiguration {
    
    // MARK: Properties
    let storiesCount: Int
    let timerTickInterval: TimeInterval
    let progressPerTick: CGFloat

    // MARK: Initialization
    init(
        storiesCount: Int,
        secondsPerStory: TimeInterval = 5,
        timerTickInterval: TimeInterval = 0.02
    ) {
        self.storiesCount = storiesCount
        self.timerTickInterval = timerTickInterval
        self.progressPerTick = 1.0 / CGFloat(storiesCount) / secondsPerStory * timerTickInterval
    }
}

// MARK: - Calculations
extension TimerConfiguration {
    
    func progress(for storyIndex: Int) -> CGFloat {
        return min(CGFloat(storyIndex) / CGFloat(storiesCount), 1)
    }

    func index(for progress: CGFloat) -> Int {
        return min(Int(progress * CGFloat(storiesCount)), storiesCount - 1)
    }

    func nextProgress(progress: CGFloat) -> CGFloat {
        return min(progress + progressPerTick, 1)
    }
}
