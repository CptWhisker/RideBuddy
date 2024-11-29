//
//  SelectionListView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

struct SelectionListView: View {
    
    let items: [String] = []
    
    @ObservedObject var coordinator: MainScreenCoordinator
    
    var body: some View {
        Button {
            coordinator.navigateToStationsList()
        } label: {
            Text("Test")
                .frame(width: 250, height: 100)
                .background(Color.red)
        }
    }
}

#Preview {
    SelectionListView(coordinator: MainScreenCoordinator())
}
