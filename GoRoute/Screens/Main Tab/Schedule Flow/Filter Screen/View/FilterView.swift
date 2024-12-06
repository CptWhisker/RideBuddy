//
//  FilterView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct FilterView: View {
    
    @ObservedObject var viewModel: RouteListViewModel
    @ObservedObject var coordinator: MainScreenCoordinator
    
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: LayoutProvider.Spacing.extraLarge) {
                timeFilterSection
                
                transferFilterSection
                
                Spacer()
                
                filterButton
            }
            .padding(.top, LayoutProvider.Padding.medium)
            .padding(.horizontal, LayoutProvider.Padding.medium)
            .onAppear {
                viewModel.resetTemporarySelections()
            }
        }
    }
}

// MARK: - Subviews
private extension FilterView {
    
    var timeFilterSection: some View {
        FilterSection(
            title: "Время отправления",
            filters: TimeFilterModel.allCases,
            imageSelector: { filter in
                viewModel.getTimeFilterImageName(filter)
            },
            filterSelector: { filter in
                viewModel.selectTimeFilter(filter)
            }
        )
    }
    
    var transferFilterSection: some View {
        FilterSection(
            title: "Показывать варианты с пересадками",
            filters: TransferFilterModel.allCases,
            imageSelector: { filter in
                viewModel.getTransferFilterImageName(filter)
            },
            filterSelector: { filter in
                viewModel.selectTransferFilter(filter)
            }
        )
    }
    
    var filterButton: some View {
        AppButtonView(
            isNotificationPresented: .constant(false),
            title: "Применить",
            width: LayoutProvider.Dimensions.General.standardWidth,
            action: {
                filterButtonTapped()
            }
        )
        .padding(.bottom, LayoutProvider.Padding.large)
    }
}

// MARK: - Private Methods
private extension FilterView {
    
    func filterButtonTapped() {
        viewModel.applyRoutesFilter()
        coordinator.navigateBack()
    }
}

// MARK: - Preview
#Preview {
    FilterView(
        viewModel: RouteListViewModel(),
        coordinator: MainScreenCoordinator()
    )
}
