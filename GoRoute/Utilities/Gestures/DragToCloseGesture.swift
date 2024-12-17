//
//  DragToCloseGesture.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 17.12.2024.
//

import SwiftUI

struct DragToCloseGesture: Gesture {
    
    let onDrag: (CGFloat) -> Void
    let onComplete: () -> Void
    let onCancel: () -> Void
    
    var body: some Gesture {
        DragGesture()
            .onChanged { value in
                if value.translation.height > 0 {
                    onDrag(value.translation.height)
                }
            }
            .onEnded { value in
                if value.translation.height > LayoutProvider.Threshold.dragToClose {
                    onComplete()
                } else {
                    onCancel()
                }
            }
    }
}
