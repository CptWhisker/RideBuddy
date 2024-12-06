//
//  Rectangle+Extensions.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

extension Rectangle {
    
    func lineStyle() -> some View {
        self.modifier(RectangleLineStyleModifier())
    }
}
