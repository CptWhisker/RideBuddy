//
//  UserAgreementView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 26.11.2024.
//

import SwiftUI
import WebKit

struct UserAgreementView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            UserAgreementWebView(htmlContent: UserAgreementProvider.userAgreemet)
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Пользовательское соглашение")
                .navigationBarTitleDisplayMode(.inline)
            
            ErrorViewFactory.errorView(for: appState.errorState)
        }
    }
}

// MARK: - Preview
#Preview {
    UserAgreementView()
}
