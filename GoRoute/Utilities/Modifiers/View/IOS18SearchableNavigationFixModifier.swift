//
//  IOS18SearchableNavigationFixModifier.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 19.12.2024.
//

import SwiftUI

struct IOS18SearchableNavigationFixModifier: ViewModifier {

    func body(content: Content) -> some View {
        NavigationView {
            content
        }
        .navigationBarBackButtonHidden()
    }
}

