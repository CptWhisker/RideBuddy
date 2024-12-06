//
//  FilterSection.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct FilterSection<T: FilterProtocol>: View {
    
    let title: String
    let filters: [T]
    let imageSelector: (T) -> String
    let filterSelector: (T) -> Void
    
    var body: some View {
        Section {
            VStack {
                ForEach(filters) { filter in
                    FilterItemView(
                        title: filter.label,
                        imageName: imageSelector(filter),
                        onTap: { filterSelector(filter) }
                    )
                }
            }
        } header: {
            Text(title)
                .titleStyle()
        }
    }
}

// MARK: - Preview
#Preview {
    let viewModel = RouteListViewModel()
    
    FilterSection(
        title: "Test Title",
        filters: TimeFilterModel.allCases,
        imageSelector: { filter in
            viewModel.getTimeFilterImageName(filter)
        },
        filterSelector: { filter in
            viewModel.selectTimeFilter(filter)
        }
    )
}
