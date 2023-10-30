//
//  StockViewModel.swift
//  StockApp
//
//  Created by Fazil P on 13/09/2023.
//

import SwiftUI


class StockViewModel: ObservableObject {
    var tickers = ["AAPL", "BA", "NVDA", "BA", "DIS", "NKE", "SBUX", "NFLX", "AMZN"]
    
    @Published var stocks: [StockModel] = [StockModel]()
    
    init() {
        self.fetchStockData()
    }
    
    
    func fetchStockData() {
        
        for ticker in tickers {
            
            APIHandler.instance.getSymbolLookup(searchQuery: ticker) { returnedLookup in
                APIHandler.instance.getSymboQuote(symbol: ticker) { returnedQuote in
                    APIHandler.instance.getCandles(symbol: ticker, hourLength: 12) { returnedCandles in
                        
                        let candleArray: [CGFloat] = returnedCandles?.c.map { CGFloat($0)} ?? []
                        
                        let stockInfo = returnedLookup?.result[0]
                        
                        let newStock = StockModel(symbol: ticker, description: stockInfo?.description, currentPrice: returnedQuote?.c, percentageChange: returnedQuote?.dp, candle: candleArray)
                        
                        DispatchQueue.main.async {
                            self.stocks.append(newStock)
                        }
                    }
                }
            }
        }
    }
}
