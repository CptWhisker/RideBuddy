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
        HStack(spacing: 4) {
            Text(route.formattedStartTime)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.appBlack)
            
            Rectangle()
                .fill(.appGray)
                .frame(height: 1)
            
            Text("\(route.travelDuration) часов")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.appBlack)
            
            Rectangle()
                .fill(.appGray)
                .frame(height: 1)
            
            Text(route.formattedEndTime)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.appBlack)
        }
        .frame(height: 48)
        .padding(.horizontal, 14)
    }
}

#Preview {
    RouteTimeView(route: MockDataProvider.mockRoute)
}
