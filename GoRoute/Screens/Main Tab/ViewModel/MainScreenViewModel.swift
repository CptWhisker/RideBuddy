//
//  MainScreenViewModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import Foundation

final class MainScreenViewModel: ObservableObject {
    
    @Published var reels = [ReelModel]()
    @Published var destinationFrom: String?
    @Published var destinationTo: String?
    
    init() {
        reels = Array(repeating: ReelModel(), count: 10)
    }
    
    func fromButtonTapped() {
        print("fromButtonTapped")
    }
    
    func toButtonTapped() {
        print("toButtonTapped")
    }
    
    func changeButtonTapped() {
        print("changeButtonTapped")
    }
}
