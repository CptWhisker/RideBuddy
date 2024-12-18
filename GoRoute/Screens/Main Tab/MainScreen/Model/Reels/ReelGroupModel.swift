//
//  ReelGroupModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 16.12.2024.
//

import SwiftUI

struct ReelGroupModel: Codable, Identifiable {
    
    // MARK: Properties
    let id: UUID
    let thumbnail: String
    let reels: [ReelModel]
    var isSeen: Bool = false
    
    var description: String {
        guard let firstReel = reels.first else { return "" }
        
        return firstReel.description
    }
    
    // MARK: Initialization
    init(id: UUID = UUID(), thumbnail: String, reels: [ReelModel], isSeen: Bool = false) {
        self.id = id
        self.thumbnail = thumbnail
        self.reels = reels
        self.isSeen = isSeen
    }
}

//MARK: - Equatable
extension ReelGroupModel: Equatable {
   
   static func == (lhs: ReelGroupModel, rhs: ReelGroupModel) -> Bool {
       return lhs.id == rhs.id &&
       lhs.thumbnail == rhs.thumbnail &&
       lhs.reels == rhs.reels &&
       lhs.isSeen == rhs.isSeen
   }
}

// MARK: - Hashable
extension ReelGroupModel: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
