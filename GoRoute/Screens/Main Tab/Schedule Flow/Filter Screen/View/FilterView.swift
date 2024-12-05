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
    
    private let buttonWidth: CGFloat = UIScreen.main.bounds.width - 32
    
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                timeFilterSection
                
                transferFilterSection
                
                Spacer()
                
                filterButton
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            .onAppear {
                viewModel.resetTemporarySelections()
            }
        }
    }
    
    // MARK: Subviews
    private var timeFilterSection: some View {
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
    
    private var transferFilterSection: some View {
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
    
    private var filterButton: some View {
        AppButtonView(
            isPresented: .constant(false),
            title: "Применить",
            dimensions: CGSize(width: buttonWidth, height: 60),
            action: {
                filterButtonTapped()
            }
        )
        .padding(.bottom, 24)
    }
}

// MARK: - Private Methods
private extension FilterView {
    
    private func filterButtonTapped() {
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
