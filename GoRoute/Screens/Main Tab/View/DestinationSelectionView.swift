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
    
    @Binding var destinationFrom: String?
    @Binding var destinationTo: String?
    
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
        
        @Binding var destination: String?
        
        let buttonWidth: CGFloat
        let destinationType: DestinationType
        let action: () -> Void
        
        var body: some View {
            Button {
                action()
            } label: {
                Text(destination ?? destinationType.rawValue)
                    .frame(width: buttonWidth, height: 48, alignment: .leading)
                    .padding(.leading, 16)
                    .background(.white)
                    .foregroundStyle(.appGray)
                    .font(.system(size: 17, weight: .regular))
            }
            .buttonStyle(.plain)
        }
    }
}
