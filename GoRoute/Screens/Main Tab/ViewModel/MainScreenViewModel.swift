//
//  MainScreenViewModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import Foundation

final class MainScreenViewModel: ObservableObject {
    
    @Published var reels = [ReelModel]()
    
    init() {
        reels = Array(repeating: ReelModel(), count: 10)
    }
}
