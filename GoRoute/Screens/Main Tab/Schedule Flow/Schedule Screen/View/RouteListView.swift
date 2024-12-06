//
//  RouteListView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct RouteListView: View {
    
    @ObservedObject var viewModel: RouteListViewModel
    @ObservedObject var coordinator: MainScreenCoordinator
        
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
        }
    }
    
    // MARK: Subviews
    private var routeList: some View {
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
    
    private var scheduleHeader: some View {
        Text(viewModel.scheduleHeader)
            .font(ResourcesProvider.FontStyle.title)
            .foregroundStyle(.accent)
            .padding(.bottom, LayoutProvider.Padding.small)
            .padding(.top, LayoutProvider.Padding.medium)
            .padding(.horizontal, LayoutProvider.Padding.medium)
    }
    
    private var filterButton: some View {
        AppButtonView(
            isPresented: $viewModel.areFiltersApplied,
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
    RouteListView(
        viewModel: RouteListViewModel(),
        coordinator: MainScreenCoordinator()
    )
}
