//
//  RouteView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 04.12.2024.
//

import SwiftUI

struct RouteCardView: View {
    
    let buttonWidth: CGFloat
    let route: RouteModel
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            VStack(spacing: 4) {
                CarrierInfoView(route: route)
                
                RouteTimeView(route: route)
            }
            .frame(width: buttonWidth, height: 104)
            .background(.appLightGray)
            .clipShape(.rect(cornerRadius: 24))
            .overlay(alignment: .topTrailing) {
                dateOverlay
            }
        }
    }
    
    // MARK: Subviews
    private var dateOverlay: some View {
        Text(route.formattedTravelDate)
            .font(.system(size: 12, weight: .regular))
            .foregroundStyle(.appBlack)
            .padding(.top, 14)
            .padding(.trailing, 8)
    }
}

// MARK: - Preview
#Preview {
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let buttonWidth: CGFloat = screenWidth - 32
    
    RouteCardView(
        buttonWidth: buttonWidth,
        route: MockDataProvider.mockRoute,
        action: { print("Action") }
    )
}
