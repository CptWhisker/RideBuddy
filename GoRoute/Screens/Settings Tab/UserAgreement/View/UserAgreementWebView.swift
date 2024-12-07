//
//  UserAgreementWebView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 27.11.2024.
//

import SwiftUI
import WebKit

struct UserAgreementWebView: UIViewRepresentable {
    
    let htmlContent: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlContent, baseURL: nil)
    }
}

// MARK: - Preview
#Preview {
    UserAgreementWebView(htmlContent: UserAgreementProvider.userAgreemet)
}
