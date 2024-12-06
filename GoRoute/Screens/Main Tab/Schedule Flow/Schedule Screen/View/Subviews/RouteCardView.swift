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
            .frame(
                width: LayoutProvider.Dimensions.General.standardWidth,
                height: LayoutProvider.Dimensions.RouteCard.height
            )
            .background(.appLightGray)
            .clipShape(.rect(cornerRadius: LayoutProvider.CornerRadius.large))
            .overlay(alignment: .topTrailing) {
                dateOverlay
            }
        }
    }
    
    // MARK: Subviews
    private var dateOverlay: some View {
        Text(route.formattedTravelDate)
            .font(ResourcesProvider.FontStyle.captionText)
            .foregroundStyle(.appBlack)
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
