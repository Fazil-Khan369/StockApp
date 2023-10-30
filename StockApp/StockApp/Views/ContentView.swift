//
//  ContentView.swift
//  StockApp
//
//  Created by Fazil P on 07/09/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var stockVM: StockViewModel = StockViewModel()
    
    @State private var isShowingStockSearchSheet: Bool = false
    
    var body: some View {
        
        VStack {
            
            
            HeaderView(showSheet: $isShowingStockSearchSheet)
                .padding()
            
            ValueCardView(stocksVM: stockVM)
            
            WatchlistView(stockVM: stockVM)
            
            Spacer()
            
           
        }
        .padding()
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $isShowingStockSearchSheet) {
            StockSearch()
        }
        .onAppear {
            APIHandler.instance.getSymboQuote(symbol: "AAPL") { returnedQuote in
                print(returnedQuote)
            }
            APIHandler.instance.getSymbolLookup(searchQuery: "Apple") { returnedLookup in
                print(returnedLookup)
           
            }
            APIHandler.instance.getCandles(symbol: "AAPL", hourLength: 8) { returnedCandles in
                print(returnedCandles)
            }
                                                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
