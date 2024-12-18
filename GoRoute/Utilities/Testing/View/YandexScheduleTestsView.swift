//
//  YandexScheduleTestsView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 26.11.2024.
//

import SwiftUI

struct YandexScheduleTestsView: View {
    
    @ObservedObject var viewModel: YandexScheduleTestsViewModel
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
                .opacity(0.25)
            
            VStack(spacing: LayoutProvider.Spacing.extraLarge) {
                ForEach(MainScreenAction.allCases) { action in
                    YandexScheduleTestsButton(title: action.rawValue) {
                        Task {
                            do {
                                try await action.performAction(on: viewModel)
                            } catch {
                                print(action.errorDescription, error.localizedDescription)
                            }
                        }
                    }
                }
            }
        }
    }
}

// MARK: - SubViews
private extension YandexScheduleTestsView {
    
    struct YandexScheduleTestsButton: View {
        
        let title: String
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Text(title)
                    .font(.headline)
                    .frame(width: 300, height: LayoutProvider.Dimensions.General.standardHeight)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: LayoutProvider.CornerRadius.small))
                    .shadow(radius: 5)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    YandexScheduleTestsView(viewModel: YandexScheduleTestsViewModel())
}
