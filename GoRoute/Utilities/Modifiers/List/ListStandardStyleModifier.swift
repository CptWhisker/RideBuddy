//
//  ListStandardStyleModifier.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

struct ListStandardStyleModifier: ViewModifier {
    
    @Binding var searchText: String
    
    let title: String
    
    func body(content: Content) -> some View {
        content
            .listStyle(.plain)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Введите запрос"
            )
    }
}
