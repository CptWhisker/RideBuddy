//
//  RouteListView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct RouteListView: View {
    
    @EnvironmentObject var appState: AppState
    
    @EnvironmentObject var viewModel: RouteListViewModel
    
    @EnvironmentObject var coordinator: MainScreenCoordinator
        
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            routeList
                .overlay(alignment: .bottom) {
                    filterButton
                }
            
            if viewModel.filteredRoutes.isEmpty {
                PlaceholderTextView(title: "Вариантов нет")
            }
            
            ErrorViewFactory.errorView(for: appState.errorState)
        }
    }
}

// MARK: - Subviews
private extension RouteListView {
    
    var routeList: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: LayoutProvider.Spacing.medium) {
                Section {
                    ForEach(viewModel.filteredRoutes) { route in
                        RouteCardView(
                            route: route,
                            action: {
                                rowTapped(for: route)
                            }
                        )
                    }
                } header: {
                    scheduleHeader
                }
            }
            .padding(.bottom, LayoutProvider.Padding.scrollViewBottomInset)
        }
    }
    
    var scheduleHeader: some View {
        Text(viewModel.scheduleHeader)
            .titleStyle()
            .padding(.bottom, LayoutProvider.Padding.small)
            .padding(.top, LayoutProvider.Padding.medium)
            .padding(.horizontal, LayoutProvider.Padding.medium)
    }
    
    var filterButton: some View {
        AppButtonView(
            isNotificationPresented: $viewModel.areFiltersApplied,
            title: "Уточнить время",
            width: LayoutProvider.Dimensions.General.standardWidth,
            action: { filterButtonTapped() }
        )
        .padding(.bottom, LayoutProvider.Padding.large)
    }
}

// MARK: - Private Methods
private extension RouteListView {
    
    func rowTapped(for route: RouteModel) {
        viewModel.selectCarrier(route.carrier)
        coordinator.navigateTo(.carrierDetails)
    }
    
    func filterButtonTapped() {
        coordinator.navigateTo(.filterScreen)
    }
}

// MARK: - Preview
#Preview {
    let appState = AppState()
    let viewModel = RouteListViewModel()
    let coordinator = MainScreenCoordinator()
    
    RouteListView()
        .environmentObject(appState)
        .environmentObject(viewModel)
        .environmentObject(coordinator)
}
