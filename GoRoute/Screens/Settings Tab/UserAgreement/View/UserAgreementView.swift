//
//  UserAgreementView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 26.11.2024.
//

import SwiftUI
import WebKit

struct UserAgreementView: View {
    var body: some View {
        UserAgreementWebView(htmlContent: UserAgreementProvider.userAgreemet)
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Пользовательское соглашение")
            .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
#Preview {
    UserAgreementView()
}
