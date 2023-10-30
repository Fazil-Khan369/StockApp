//
//  HeaderView.swift
//  StockApp
//
//  Created by Fazil P on 08/09/2023.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showSheet: Bool
    
    var body: some View {
       
        HStack {
            Text("My Stocks")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color.darkBlue)
            
            Spacer()
            
            Button {
                print(("tapped search"))
                showSheet.toggle()
            } label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .accentColor(Color.darkBlue)
                    .font(.system(size: 40))
            }

        }
    }
}




