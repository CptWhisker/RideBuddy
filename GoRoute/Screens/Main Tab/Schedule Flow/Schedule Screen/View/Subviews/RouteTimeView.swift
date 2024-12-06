//
//  RouteTimeView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct RouteTimeView: View {
    
    let route: RouteModel
    
    var body: some View {
        HStack(spacing: LayoutProvider.Spacing.small) {
            Text(route.formattedStartTime)
                .font(ResourcesProvider.FontStyle.bodyText)
                .foregroundStyle(.appBlack)
            
            Rectangle()
                .fill(.appGray)
                .frame(height: LayoutProvider.Dimensions.General.line)
            
            Text("\(route.travelDuration) часов")
                .font(ResourcesProvider.FontStyle.captionText)
                .foregroundStyle(.appBlack)
            
            Rectangle()
                .fill(.appGray)
                .frame(height: LayoutProvider.Dimensions.General.line)
            
            Text(route.formattedEndTime)
                .font(ResourcesProvider.FontStyle.bodyText)
                .foregroundStyle(.appBlack)
        }
        .frame(height: LayoutProvider.Dimensions.RouteCard.timeViewHeight)
        .padding(.horizontal, LayoutProvider.Padding.medium)
    }
}

// MARK: - Preview
#Preview {
    RouteTimeView(route: MockDataProvider.mockRoute)
}
