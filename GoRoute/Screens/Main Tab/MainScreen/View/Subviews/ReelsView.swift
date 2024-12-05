//
//  ReelsView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

struct ReelsView: View {
    
    let reels: [ReelModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(reels) { _ in
                    Rectangle()
                        .fill(Color.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(Color.appBlue, lineWidth: 4)
                        }
                        .frame(width: 92, height: 140)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
        }
    }
}

#Preview {
    ReelsView(reels: Array(repeating: ReelModel(), count: 10))
}
