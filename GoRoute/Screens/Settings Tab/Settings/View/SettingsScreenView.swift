//
//  SettingsScreenView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 26.11.2024.
//

import SwiftUI

struct SettingsScreenView: View {
    
    @State private var path: [SettingsNavigationModel] = []
    
    @ObservedObject var viewModel: SettingsScreenViewModel
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.main
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    SettingsToggle(title: "Темная тема", isOn: $viewModel.isDarkModeEnabled)
                        
                    SettingsButton(title: "Пользовательское соглашение") {
                        navigateTo(.userAgreement)
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
                }
            }
        }
    }
}

#Preview {
    SettingsScreenView(viewModel: SettingsScreenViewModel())
}

private extension SettingsScreenView {
    
    func navigateTo(_ destination: SettingsNavigationModel) {
        path.append(destination)
    }
}

// MARK: - SubViews
private extension SettingsScreenView {
    
    struct SettingsButton: View {
        
        let title: String
        let action: () -> Void
        
        var body: some View {
            Button {
                action()
            } label: {
                HStack {
                    Text(title)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(.accent)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(.accent)
                }
            }
            .frame(height: 60)
        }
    }
    
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
