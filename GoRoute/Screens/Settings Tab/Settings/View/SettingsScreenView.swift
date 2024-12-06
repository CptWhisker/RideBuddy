//
//  SettingsScreenView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 26.11.2024.
//

import SwiftUI

struct SettingsScreenView: View {
    
    @EnvironmentObject var coordinator: SettingsScreenCoordinator
    
    @ObservedObject var viewModel: SettingsScreenViewModel
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.main
                    .ignoresSafeArea()
                
                VStack(spacing: LayoutProvider.Spacing.none) {
                    SettingsToggle(title: "Темная тема", isOn: $viewModel.isDarkModeEnabled)
                        
                    NavigationRowView(title: "Пользовательское соглашение") {
                        userAgreementButtonTapped()
                    }
                    
                    Spacer()
                    
                    copyright
                }
                .padding(.horizontal, LayoutProvider.Padding.medium)
            }
            .navigationDestination(for: SettingsNavigationModel.self) { destination in
                switch destination {
                    
                case .userAgreement:
                    UserAgreementView()
                        .navigationBackButton(coordinator: coordinator)
                        .toolbar(.hidden, for: .tabBar)
                }
            }
        }
    }
}

// MARK: - SubViews
private extension SettingsScreenView {

    struct SettingsToggle: View {
        
        let title: String
        let isOn: Binding<Bool>
        
        var body: some View {
            Toggle(isOn: isOn) {
                Text(title)
                    .font(ResourcesProvider.FontStyle.bodyText)
                    .foregroundStyle(.accent)
            }
            .tint(.appGray)
            .frame(height: LayoutProvider.Dimensions.General.standardHeight)
        }
    }
    
    var copyright: some View {
        Text("Приложение использует API «Яндекс.Расписания»\nВерсия 1.0 (beta)")
            .font(ResourcesProvider.FontStyle.captionText)
            .foregroundStyle(.accent)
            .multilineTextAlignment(.center)
            .lineSpacing(LayoutProvider.Spacing.extraLarge)
            .padding(.bottom, LayoutProvider.Padding.large)
    }
}

// MARK: - SubViews
private extension SettingsScreenView {
    
    func userAgreementButtonTapped() {
        coordinator.navigateTo(.userAgreement)
    }
}

// MARK: - Preview
#Preview {
    let coordinator = SettingsScreenCoordinator()
    SettingsScreenView(viewModel: SettingsScreenViewModel()).environmentObject(coordinator)
}
