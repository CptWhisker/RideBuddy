//
//  CarrierInfoView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct CarrierInfoView: View {
    
    let route: RouteModel
    
    var body: some View {
        HStack(spacing: 8) {
            Image(route.carrier.smallLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 38, height: 38)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(route.carrier.shortName)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(.appBlack)
                
                if let transfer = route.transfers.first {
                    Text("С пересадкой в \(transfer.name)")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.appRed)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 14)
        .padding(.top, 14)
    }
}

#Preview {
    CarrierInfoView(route: MockDataProvider.mockRoute)
}
