//
//  CloseButton.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 16.12.2024.
//

import SwiftUI

struct CloseButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(.closeButton)
        }
    }
}

#Preview {
    CloseButton(
        action: {}
    )
}
