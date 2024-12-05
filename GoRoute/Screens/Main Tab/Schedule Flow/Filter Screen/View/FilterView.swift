//
//  FilterView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct FilterView: View {
    
    @ObservedObject var viewModel: RouteListViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FilterView(
        viewModel: RouteListViewModel()
    )
}
