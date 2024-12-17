//
//  TimerManager.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 17.12.2024.
//

import Foundation
import Combine

final class TimerManager {
    
    private var timerCancellable: AnyCancellable?
    
    func start(with interval: TimeInterval, action: @escaping () -> Void) {
        stop()
        timerCancellable = Timer.publish(every: interval, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                action()
            }
    }
    
    func stop() {
        timerCancellable?.cancel()
        timerCancellable = nil
    }
}
