//
//  WatchlistView.swift
//  StockApp
//
//  Created by Fazil P on 10/09/2023.
//

import SwiftUI

struct WatchlistView: View {
    @StateObject var stockVM: StockViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Watchlist")
                    .font(.title)
                    .bold()
                    .foregroundColor(.darkBlue)
                
                Spacer()
            }
            
            ScrollView {
                VStack {
                    ForEach(stockVM.stocks, id: \.self) { stock in
                        StockView(stockModel: stock)
                    }
                }
            }
        }
    }
}

//struct WatchlistView_Previews: PreviewProvider {
//    static var previews: some View {
//        WatchlistView()
//    }
//}
