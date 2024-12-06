//
//  DestinationSelectionView.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 29.11.2024.
//

import SwiftUI

struct DestinationSelectionView: View {
    
//    let buttonWidth: CGFloat
    let actionFrom: () -> Void
    let actionTo: () -> Void
    let changeAction: () -> Void
    
    @Binding var destinationFrom: SelectionModel?
    @Binding var destinationTo: SelectionModel?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.medium)
                .fill(.appBlue)
            
            HStack {
                VStack(spacing: LayoutProvider.Spacing.none) {
                    DestinationButton(
                        destination: $destinationFrom,
                        destinationType: .destinationFrom) {
                            actionFrom()
                        }
                    
                    DestinationButton(
                        destination: $destinationTo,
                        destinationType: .destinationTo) {
                            actionTo()
                        }
                }
                .clipShape(RoundedRectangle(cornerRadius: LayoutProvider.CornerRadius.medium))
                .padding(.leading, LayoutProvider.Padding.medium)
                
                Spacer()
                
                changeButton
            }
        }
        .frame(height: LayoutProvider.Dimensions.DestinationSelection.height)
        .padding(.horizontal, LayoutProvider.Padding.medium)
    }
}

// MARK: - Subviews
private extension DestinationSelectionView {
    
    var changeButton: some View {
        Button {
            changeAction()
        } label: {
            Image(systemName: ResourcesProvider.Icon.changeButton)
                .changeButtonStyle()
                .padding(.trailing, LayoutProvider.Padding.medium)
        }
    }
    
    struct DestinationButton: View {
        
        @Binding var destination: SelectionModel?
        
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
                    .padding(.horizontal, LayoutProvider.Padding.medium)
                    .frame(
                        width: LayoutProvider.Dimensions.Button.destinationWidth,
                        height: LayoutProvider.Dimensions.Button.destinationHeight,
                        alignment: .leading
                    )
                    .background(.white)
                    .foregroundStyle((destination != nil) ? .appBlack : .appGray)
                    .font(ResourcesProvider.FontStyle.bodyText)
                    .lineLimit(1)
            }
            .buttonStyle(.plain)
        }
    }
}

// MARK: - Preview
#Preview {
    DestinationSelectionView(
        actionFrom: { print("From") },
        actionTo: { print("To") },
        changeAction: { print("Change") },
        destinationFrom: .constant(nil),
        destinationTo: .constant(nil)
    )
}
