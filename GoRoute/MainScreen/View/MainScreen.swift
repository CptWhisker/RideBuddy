//
//  ContentView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 10.11.2024.
//

import SwiftUI

struct MainScreen: View {
    
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        VStack {
            Button {
                viewModel.getNearestStations()
            } label: {
                Text("Get nearest stations")
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.buttonBorder)
            }
            
            Spacer()
        }
        .padding(.top, 30)
    }
}

#Preview {
    MainScreen(viewModel: MainScreenViewModel())
}
