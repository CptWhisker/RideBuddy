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
                
                VStack(spacing: 0) {
                    SettingsToggle(title: "Темная тема", isOn: $viewModel.isDarkModeEnabled)
                        
                    NavigationRowView(title: "Пользовательское соглашение") {
                        coordinator.navigateTo(.userAgreement)
                    }
                    
                    Spacer()
                    
                    copyright
                }
                .padding(.horizontal, 16)
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

#Preview {
    let coordinator = SettingsScreenCoordinator()
    SettingsScreenView(viewModel: SettingsScreenViewModel()).environmentObject(coordinator)
}

// MARK: - SubViews
private extension SettingsScreenView {

    struct SettingsToggle: View {
        
        let title: String
        let isOn: Binding<Bool>
        
        var body: some View {
            Toggle(isOn: isOn) {
                Text(title)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(.accent)
            }
            .tint(.appGray)
            .frame(height: 60)
        }
    }
    
    var copyright: some View {
        Text("Приложение использует API «Яндекс.Расписания»\nВерсия 1.0 (beta)")
            .font(.system(size: 12, weight: .regular))
            .foregroundStyle(.accent)
            .multilineTextAlignment(.center)
            .lineSpacing(16)
            .padding(.bottom, 24)
    }
}
