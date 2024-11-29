//
//  MainScreenViewModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

final class MainScreenViewModel: ObservableObject {
    
    // MARK: Properties
    @Published var reels = [ReelModel]()
    @Published var destinationFrom: String?
    @Published var destinationTo: String?
    
    // MARK: Initialization
    init() {
        reels = generateReels()
    }
    
    // MARK: Private Methods
    private func generateReels() -> [ReelModel] {
        (0..<10).map { _ in ReelModel() }
    }
    
    // MARK: Public Methods
    func changeButtonTapped() {
        (destinationFrom, destinationTo) = (destinationTo, destinationFrom)
    }
}
