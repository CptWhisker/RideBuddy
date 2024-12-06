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
        HStack(spacing: LayoutProvider.Spacing.medium) {
            Image(route.carrier.smallLogo)
                .resizable()
                .scaledToFit()
                .frame(
                    width: LayoutProvider.Dimensions.Carrier.logo,
                    height: LayoutProvider.Dimensions.Carrier.logo
                )
            
            VStack(alignment: .leading, spacing: LayoutProvider.Spacing.tiny) {
                Text(route.carrier.shortName)
                    .font(ResourcesProvider.FontStyle.bodyText)
                    .foregroundStyle(.appBlack)
                
                if let transfer = route.transfers.first {
                    Text("С пересадкой в \(transfer.name)")
                        .font(ResourcesProvider.FontStyle.captionText)
                        .foregroundStyle(.appRed)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, LayoutProvider.Padding.medium)
        .padding(.top, LayoutProvider.Padding.medium)
    }
}

// MARK: - Preview
#Preview {
    CarrierInfoView(route: MockDataProvider.mockRoute)
}
