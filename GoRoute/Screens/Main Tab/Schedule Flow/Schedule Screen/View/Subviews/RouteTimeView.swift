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
                .bodyTextStyle(.appBlack)
            
            Rectangle()
                .lineStyle()
            
            Text("\(route.travelDuration) часов")
                .bodyTextStyle(.appBlack)
            
            Rectangle()
                .lineStyle()
            
            Text(route.formattedEndTime)
                .bodyTextStyle(.appBlack)
        }
        .frame(height: LayoutProvider.Dimensions.RouteCard.timeViewHeight)
        .padding(.horizontal, LayoutProvider.Padding.medium)
    }
}

// MARK: - Preview
#Preview {
    RouteTimeView(route: MockDataProvider.mockRoute)
}
