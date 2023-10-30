//
//  StockModel.swift
//  StockApp
//
//  Created by Fazil P on 13/09/2023.
//

import Foundation


struct StockModel: Hashable {
    
    let symbol: String
    let description: String?
    let currentPrice: Double?
    let percentageChange: Double?
    let candle: [CGFloat]
}
