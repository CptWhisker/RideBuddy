//
//  MainScreenView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 10.11.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            VStack {
                reelsView
                
                Spacer()
            }
            .padding(.top, 24)
        }
    }
}

#Preview {
    MainScreenView(viewModel: MainScreenViewModel())
}

// MARK: - SubViews
private extension MainScreenView {
    
    var reelsView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(viewModel.reels) { _ in
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
        }
        .scrollIndicators(.hidden)
    }
}
