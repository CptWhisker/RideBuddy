//
//  ErrorViewFactory.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 07.12.2024.
//

import SwiftUI

struct ErrorViewFactory {

    @ViewBuilder
    static func errorView(for errorState: ErrorState) -> some View {
        switch errorState {
        case .noInternet:
            ErrorView(image: .noInternet, title: "Нет интернета")
        case .serverError:
            ErrorView(image: .serverError, title: "Ошибка сервера")
        default:
            EmptyView()
        }
    }
}
