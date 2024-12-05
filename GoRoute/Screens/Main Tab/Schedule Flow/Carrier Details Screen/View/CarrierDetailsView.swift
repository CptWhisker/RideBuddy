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
            
            VStack(alignment: .leading, spacing: 16) {
                carrierLogo

                carrierName

                contactInfo
                
                Spacer()
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
    }
    
    private var carrierLogo: some View {
        Image(carrier.fullLogo)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
    }
    
    private var carrierName: some View {
        Text(carrier.fullName)
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.accent)
    }
    
    private var contactInfo: some View {
        VStack(alignment: .leading, spacing: 0) {
            contactRow(title: "E-mail", value: carrier.email)
            contactRow(title: "Телефон", value: carrier.phone)
        }
    }
    
    private func contactRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.accent)
            
            Text(value)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.appBlue)
        }
        .frame(height: 60)
    }
}

#Preview {
    CarrierDetailsView(carrier: MockDataProvider.mockCarrier)
}
