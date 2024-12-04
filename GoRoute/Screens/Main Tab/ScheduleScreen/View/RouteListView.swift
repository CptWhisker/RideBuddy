//
//  RouteListView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct RouteListView: View {
    
    let destinationFrom: SelectionModel
    let destinationTo: SelectionModel
    private let buttonWidth: CGFloat = UIScreen.main.bounds.width - 32
    private let routes: [RouteModel] = MockDataProvider.mockRoutes
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                Section {
                    ForEach(routes) { route in
                        RouteCardView(
                            buttonWidth: buttonWidth,
                            route: route,
                            action: { print("Route selected: \(route.origin.name) - \(route.destination.name)") }
                        )
                    }
                } header: {
                    Text("\(destinationFrom.station.name) → \(destinationTo.station.name)")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.appBlack)
                        .padding(.bottom, 8)
                }
            }
        }
        
        AppButtonView(
            title: "Уточнить время",
            dimensions: CGSize(width: buttonWidth, height: 60),
            action: { print("AppButton tapped") }
        )
        .padding(.bottom, 24)
    }
}

#Preview {
    RouteListView(
        destinationFrom: MockDataProvider.mockSelections.first!,
        destinationTo: MockDataProvider.mockSelections.last!
    )
}
