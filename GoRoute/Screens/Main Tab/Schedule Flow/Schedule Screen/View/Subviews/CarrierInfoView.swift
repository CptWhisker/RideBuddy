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
                .carrierThumbnailStyle()
            
            VStack(alignment: .leading, spacing: LayoutProvider.Spacing.tiny) {
                Text(route.carrier.shortName)
                    .bodyTextStyle(.appBlack)
                
                if let transfer = route.transfers.first {
                    Text("С пересадкой в \(transfer.name)")
                        .captionTextStyle(.appRed)
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
