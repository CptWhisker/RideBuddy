//
//  CarrierDetailsView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import SwiftUI

struct CarrierDetailsView: View {
    
    let carrier: CarrierModel
    
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: LayoutProvider.Spacing.extraLarge) {
                carrierLogo

                carrierName

                contactInfo
                
                Spacer()
            }
            .padding(.top, LayoutProvider.Padding.medium)
            .padding(.horizontal, LayoutProvider.Padding.medium)
        }
        .navigationTitle("Информация о перевозчике")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: Subviews
    private var carrierLogo: some View {
        Image(carrier.fullLogo)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
    }
    
    private var carrierName: some View {
        Text(carrier.fullName)
            .font(ResourcesProvider.FontStyle.title)
            .foregroundStyle(.accent)
    }
    
    private var contactInfo: some View {
        VStack(alignment: .leading, spacing: LayoutProvider.Spacing.none) {
            contactRow(title: "E-mail", value: carrier.email)
            contactRow(title: "Телефон", value: carrier.phone)
        }
    }
}

// MARK: - Private Methods
private extension CarrierDetailsView {
    
    func contactRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: LayoutProvider.Spacing.none) {
            Text(title)
                .font(ResourcesProvider.FontStyle.bodyText)
                .foregroundStyle(.accent)
            
            Text(value)
                .font(ResourcesProvider.FontStyle.captionText)
                .foregroundStyle(.appBlue)
        }
        .frame(height: LayoutProvider.Dimensions.General.standardHeight)
    }
}

// MARK: - Preview
#Preview {
    CarrierDetailsView(carrier: MockDataProvider.mockCarrier)
}
