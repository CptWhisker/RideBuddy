//
//  DestinationSelectionView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

struct DestinationSelectionView: View {
    
    let buttonWidth: CGFloat
    let actionFrom: () -> Void
    let actionTo: () -> Void
    let changeAction: () -> Void
    
    @Binding var destinationFrom: SelectionModel?
    @Binding var destinationTo: SelectionModel?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.appBlue)
            
            HStack {
                VStack(spacing: 0) {
                    DestinationButton(
                        destination: $destinationFrom,
                        buttonWidth: buttonWidth,
                        destinationType: .destinationFrom) {
                            actionFrom()
                        }
                    
                    DestinationButton(
                        destination: $destinationTo,
                        buttonWidth: buttonWidth,
                        destinationType: .destinationTo) {
                            actionTo()
                        }
                }
                .frame(width: buttonWidth, height: 96)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.leading, 16)
                
                Spacer()
                
                changeButton
            }
        }
        .frame(height: 128)
        .padding(.horizontal, 16)
    }
}

// MARK: - SubViews
private extension DestinationSelectionView {
    
    var changeButton: some View {
        Button {
            changeAction()
        } label: {
            Image(systemName: "arrow.2.squarepath")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(.appBlue)
                .fontWeight(.bold)
                .frame(width: 36, height: 36)
                .background(.appWhite, in: Circle())
                .padding(.trailing, 16)
        }
    }
    
    struct DestinationButton: View {
        
        @Binding var destination: SelectionModel?
        
        let buttonWidth: CGFloat
        let destinationType: DestinationType
        let action: () -> Void
        
        private var formattedDestinationString: String {
            guard let destination else { return destinationType.rawValue }
            
            return "\(destination.cityName ?? "") (\(destination.station.name))"
        }
        
        var body: some View {
            Button {
                action()
            } label: {
                Text(formattedDestinationString)
                    .padding(.horizontal, 16)
                    .frame(width: buttonWidth, height: 48, alignment: .leading)
                    .background(.white)
                    .foregroundStyle((destination != nil) ? .appBlack : .appGray)
                    .font(.system(size: 17, weight: .regular))
                    .lineLimit(1)
            }
            .buttonStyle(.plain)
        }
    }
}

// MARK: - Preview
#Preview {
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let buttonWidth: CGFloat = screenWidth - 16 - 16 - 16 - 36 - 16 - 16
    
    DestinationSelectionView(
        buttonWidth: buttonWidth,
        actionFrom: { print("From") },
        actionTo: { print("To") },
        changeAction: { print("Change") },
        destinationFrom: .constant(nil),
        destinationTo: .constant(nil)
    )
}
