//
//  RouteListView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct RouteListView: View {
    
    @EnvironmentObject var appState: AppState
    
    @StateObject var viewModel: RouteListViewModel
    
    @ObservedObject var coordinator: MainScreenCoordinator
    
    private let buttonWidth: CGFloat = UIScreen.main.bounds.width - 32
    
    var body: some View {
        routeList
            .overlay(alignment: .bottom) {
                filterButton
            }
    }
    
    // MARK: - Subviews
    private var routeList: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 8) {
                    Section {
                        ForEach(viewModel.filteredRoutes) { route in
                            RouteCardView(
                                buttonWidth: buttonWidth,
                                route: route,
                                action: {
                                    appState.selectCarrier(route.carrier)
                                    coordinator.navigateTo(.carrierDetails)
                                }
                            )
                        }
                    } header: {
                        scheduleHeader
                    }
                }
                .padding(.bottom, 92)
            }
        }
    }
    
    private var scheduleHeader: some View {
        Text(viewModel.scheduleHeader)
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.accent)
            .padding(.bottom, 8)
    }
    
    private var filterButton: some View {
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
        viewModel: RouteListViewModel(
            destinationFrom: MockDataProvider.mockSelections.first!,
            destinationTo: MockDataProvider.mockSelections.last!
        ),
        coordinator: MainScreenCoordinator()
    )
}
