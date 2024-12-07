//
//  LayoutProvider.swift
//  GoRoute
//
//  Created by АAleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

enum LayoutProvider {
    
    // MARK: - Global layout constants
    enum Screen {
        static let width: CGFloat = UIScreen.main.bounds.width
    }
    
    enum Padding {
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
        
        /*
         A computed value representing the bottom inset for a scroll view.
         
         This value combines:
         - The large padding at the bottom of the content.
         - The height of the button at the bottom of the view.
         - A small padding value to add spacing between the content and the button.
         
         Used in `RouteListView.routeList` to handle overscroll scenarios where
         the button should not overlap with the scrollable content.
         */
        static var scrollViewBottomInset: CGFloat {
            Padding.large + Dimensions.General.standardHeight + Padding.small
        }
    }
    
    enum Spacing {
        static let none: CGFloat = 0
        static let tiny: CGFloat = 2
        static let small: CGFloat = 4
        static let medium: CGFloat = 8
        static let large: CGFloat = 12
        static let extraLarge: CGFloat = 16
    }
    
    enum CornerRadius {
        static let small: CGFloat = 16
        static let medium: CGFloat = 20
        static let large: CGFloat = 24
    }
    
    enum BorderWidth {
        static let small: CGFloat = 1
        static let medium: CGFloat = 2
        static let large: CGFloat = 4
    }
    
    //MARK: - Component-specific dimensions
    enum Dimensions {
        
        enum General {
            static let line: CGFloat = 1
            static let icon: CGFloat = 24
            static let checkBox: CGFloat = 20
            static let badge: CGFloat = 8
            static let standardHeight: CGFloat = 60
            static var standardWidth: CGFloat {
                Screen.width - (2 * Padding.medium)
            }
        }
        
        enum Button {
            static let standardHeight: CGFloat = 60
            static let destinationHeight: CGFloat = 48
            static let appSmallWidth: CGFloat = 150
            static let changeButton: CGFloat = 36
            static var standardWidth: CGFloat {
                Screen.width - (2 * Padding.medium)
            }
            
            /*
             A computed value representing the width of a 'DestinationButton'.
             
             This value calculates the remaining width by subtracting:
             - Two medium paddings for the horizontal margins of the underlying view.
             - The width of the 'changeButton'.
             - Two medium paddings for the horizontal margins of the 'changeButton'.
             - The medium padding for the leading margin of the 'DestinationButton'.
             
             Used in `DestinationSelectionView` to dynamically adjust the button's width
             based on the screen size.
             */
            static var destinationWidth: CGFloat {
                Screen.width - (2 * Padding.medium) - Button.changeButton - (2 * Padding.medium) - Padding.medium
            }
        }
        
        enum Reel {
            static let height: CGFloat = 140
            static let width: CGFloat = 92
        }
        
        enum Carrier {
            static let logo: CGFloat = 38
        }
        
        enum RouteCard {
            static let height: CGFloat = 104
            static let timeViewHeight: CGFloat = 48
        }
        
        enum DestinationSelection {
            static let height: CGFloat = 128
        }
    }
}
