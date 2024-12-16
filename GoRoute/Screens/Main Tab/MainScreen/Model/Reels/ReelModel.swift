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
