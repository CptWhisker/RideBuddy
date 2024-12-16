//
//  ReelModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

struct ReelModel: Identifiable {
    
    let id = UUID()
    let contentImage: ImageResource
    let title: String
    let description: String
}

//MARK: - Equatable
extension ReelModel: Equatable {
   
   static func == (lhs: ReelModel, rhs: ReelModel) -> Bool {
       return lhs.id == rhs.id &&
       lhs.contentImage == rhs.contentImage &&
       lhs.title == rhs.title &&
       lhs.description == rhs.description
   }
}

// MARK: - Hashable
extension ReelModel: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
