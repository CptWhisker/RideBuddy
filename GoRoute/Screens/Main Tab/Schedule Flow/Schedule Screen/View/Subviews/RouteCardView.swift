//
//  RouteView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import SwiftUI

struct RouteCardView: View {
    
    let route: RouteModel
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            VStack(spacing: LayoutProvider.Spacing.small) {
                CarrierInfoView(route: route)
                
                RouteTimeView(route: route)
            }
            .overlay(alignment: .topTrailing) {
                dateOverlay
            }
        }
        .routeCardStandardStyle()
    }
}

// MARK: - Subviews
private extension RouteCardView {
    
    var dateOverlay: some View {
        Text(route.formattedTravelDate)
            .captionTextStyle(.appBlack)
            .padding(.top, LayoutProvider.Padding.medium)
            .padding(.trailing, LayoutProvider.Padding.small)
    }
}

// MARK: - Preview
#Preview {
    RouteCardView(
        route: MockDataProvider.mockRoute,
        action: { print("Action") }
    )
}
