//
//  ReelGroupModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 16.12.2024.
//

import SwiftUI

struct ReelGroupModel: Identifiable {
    
    let id = UUID()
    let thumbnail: ImageResource
    let reels: [ReelModel]
    var isSeen: Bool = false
    
    var description: String {
        guard let firstReel = reels.first else { return "" }
        
        return firstReel.description
    }
}

// MARK: - Equatable
extension ReelGroupModel: Equatable {
    
    static func == (lhs: ReelGroupModel, rhs: ReelGroupModel) -> Bool {
        lhs.id == rhs.id
    }
}
