//
//  FontProvider.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 06.12.2024.
//

import SwiftUI

enum ResourcesProvider {
    
    enum FontStyle {
        static let largeTitle: Font = Font.system(size: 34, weight: .bold)
        static let title: Font = Font.system(size: 24, weight: .bold)
        static let subtitle: Font = Font.system(size: 20, weight: .regular)
        static let buttonLabel: Font = .system(size: 17, weight: .bold)
        static let bodyText: Font = .system(size: 17, weight: .regular)
        static let captionText: Font = .system(size: 12, weight: .regular)
    }
    
    enum Icon {
        static let navigationBackButton: String = "chevron.left"
        static let navigationRowIcon: String = "chevron.right"
        static let changeButton: String = "arrow.2.squarepath"
        static let mainTabIcon: String = "arrow.up.message"
        static let settingsTabIcon: String = "gearshape"
        static let emptyRectCheckbox: String = "square"
        static let markedRectCheckbox: String = "checkmark.square"
        static let emptyCircleCheckbox: String = "circle"
        static let markedCircleCheckbox: String = "record.circle"
    }
    
    enum ReelGroup {
        enum Reel1 {
            static let thumbnailImage: String = "reelPreview1"
            static let reelImage1: String = "reelBig1_1"
            static let reelImage2: String = "reelBig1_2"
        }
        
        enum Reel2 {
            static let thumbnailImage: String = "reelPreview2"
            static let reelImage1: String = "reelBig2_1"
            static let reelImage2: String = "reelBig2_2"
        }
        
        enum Reel3 {
            static let thumbnailImage: String = "reelPreview3"
            static let reelImage1: String = "reelBig3_1"
            static let reelImage2: String = "reelBig3_2"
        }
        
        enum Reel4 {
            static let thumbnailImage: String = "reelPreview4"
            static let reelImage1: String = "reelBig4_1"
            static let reelImage2: String = "reelBig4_2"
        }
        
        enum Reel5 {
            static let thumbnailImage: String = "reelPreview5"
            static let reelImage1: String = "reelBig5_1"
            static let reelImage2: String = "reelBig5_2"
        }
        
        enum Reel6 {
            static let thumbnailImage: String = "reelPreview6"
            static let reelImage1: String = "reelBig6_1"
            static let reelImage2: String = "reelBig6_2"
        }
        
        enum Reel7 {
            static let thumbnailImage: String = "reelPreview7"
            static let reelImage1: String = "reelBig7_1"
            static let reelImage2: String = "reelBig7_2"
        }
        
        enum Reel8 {
            static let thumbnailImage: String = "reelPreview8"
            static let reelImage1: String = "reelBig8_1"
            static let reelImage2: String = "reelBig8_2"
        }
        
        enum Reel9 {
            static let thumbnailImage: String = "reelPreview9"
            static let reelImage1: String = "reelBig9_1"
            static let reelImage2: String = "reelBig9_2"
        }
    }
    
    enum TextLineLimit {
        static let reelTitle: Int = 2
        static let reelDescription: Int = 3
    }
}
