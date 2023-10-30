//
//  StockSearch.swift
//  StockApp
//
//  Created by Fazil P on 12/09/2023.
//

import SwiftUI

struct StockSearch: View {
    @State private var searchSymbol: String = ""
    
    var body: some View {
        
        VStack {
            TextField("Stock Ticker symbol", text: $searchSymbol)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.darkBlue, lineWidth: 1)
                )
                .padding()
                .textInputAutocapitalization(.never)
            Divider()
            
            
            StockCell(stock: "AApl", description: "Apple computers")
            Divider()
            StockCell(stock: "AApl", description: "Apple computers")
            Divider()
            StockCell(stock: "AApl", description: "Apple computers")
            Divider()
            
         
            
         Spacer()
            
        }
    }
}

struct StockSearch_Previews: PreviewProvider {
    static var previews: some View {
        StockSearch()
    }
}
