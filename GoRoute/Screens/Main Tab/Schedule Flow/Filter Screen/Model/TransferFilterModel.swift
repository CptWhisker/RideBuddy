//
//  TransferFilterModel.swift
//  GoRoute
//
//  Created by Aleksandr Moskovtsev on 05.12.2024.
//

import Foundation

enum TransferFilterModel: String, CaseIterable, FilterProtocol {
    case include = "Да"
    case exclude = "Нет"
    
    var label: String { rawValue }
    var id: String { rawValue }
}
