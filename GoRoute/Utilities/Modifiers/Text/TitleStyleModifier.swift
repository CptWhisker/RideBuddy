//
//  TitleStyleModifier.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

struct TitleStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(ResourcesProvider.FontStyle.title)
            .foregroundStyle(.accent)
    }
}
