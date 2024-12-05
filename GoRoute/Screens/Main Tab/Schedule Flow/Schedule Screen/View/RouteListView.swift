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
    
    private let buttonWidth: CGFloat = UIScreen.main.bounds.width - 32
    
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
            LazyVStack(spacing: 8) {
                Section {
                    ForEach(viewModel.filteredRoutes) { route in
                        RouteCardView(
                            buttonWidth: buttonWidth,
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
            .padding(.bottom, 92)
        }
    }
    
    private var scheduleHeader: some View {
        Text(viewModel.scheduleHeader)
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.accent)
            .padding(.bottom, 8)
            .padding(.top, 16)
            .padding(.horizontal, 16)
    }
    
    private var filterButton: some View {
        AppButtonView(
            isPresented: $viewModel.areFiltersApplied,
            title: "Уточнить время",
            dimensions: CGSize(width: buttonWidth, height: 60),
            action: { filterButtonTapped() }
        )
        .padding(.bottom, 24)
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
