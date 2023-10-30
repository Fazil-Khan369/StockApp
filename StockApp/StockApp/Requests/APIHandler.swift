//
//  APIHandler.swift
//  StockApp
//
//  Created by Fazil P on 12/09/2023.
//

import Foundation


class APIHandler {
    
    static let instance = APIHandler()
    
    
    private var url = "https://finnhub.io/api/v1/"
    private var token = "&token=ck08n01r01qtrbklue80ck08n01r01qtrbklue8g"
    
    public func getSymboQuote(symbol: String, handler:@escaping(_ returnedQuote: Quote?) -> ()) {
        let query: String = "quote?symbol=\(symbol)"
        let url = URL(string: url + query + token)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    
                    print("error getting quote: \(error)")
                    
                    return
                }
                
                guard let quoteData = data else {
                    
                    print("symbol search data not valid")
                    
                    return
                }
                
                let returnedQuote = try? JSONDecoder().decode(Quote.self, from: quoteData)
                
                handler(returnedQuote)
            }
            task.resume()
            
        }
    }
    
    public func getSymbolLookup(searchQuery: String, handler: @escaping(_ returnedLookup: StockSymbolSearch?) -> ()) {
        
        let query: String = "search?q=\(searchQuery)"
        
        let url = URL(string: url + query + token)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print("Error searching for symbols: \(error)")
                    return
                }
                else {
                    guard let searchData = data else {
                        print("symbol search not valid")
                        return
                    }
                    
                    let returnedSymbol = try? JSONDecoder().decode(StockSymbolSearch.self, from: searchData)
                    
                    handler(returnedSymbol)
                }
            }
            task.resume()
        }
    }
    
    public func getCandles(symbol: String, hourLength: Int, handler: @escaping(_ returnedCandles: Candles?) -> ()) {
        
        let endDate = Int(Date().timeIntervalSince1970)
        
        let startDate = Int((Calendar.current.date(byAdding: .day, value: -(hourLength), to: Date())?.timeIntervalSince1970 ??
                             Date().timeIntervalSince1970))
        
        let query = "stock/candle?symbol=\(symbol)&resolution=5&from=\(startDate)&to=\(endDate)"
        
        let url = URL(string: url + query + token)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print("Error getting candles: \(error)")
                    return
                }
                else {
                    guard let searchData = data else {
                        print("candle data not valid")
                        return
                    }
                    
                    let returnedSymbol = try? JSONDecoder().decode(Candles.self, from: searchData)
                    
                    handler(returnedSymbol)
                }
            }
            task.resume()
        }
    }
}
