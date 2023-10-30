//
//  ValueCardView.swift
//  StockApp
//
//  Created by Fazil P on 09/09/2023.
//

import SwiftUI

struct ValueCardView: View {
    
    @StateObject var stocksVM: StockViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Protfolio Value")
                .foregroundColor(Color.gray)
                .font(.title2)
            
            HStack(alignment: .top) {
                Text("\(String(format: "%.2f", stocksVM.stocks.map({$0.currentPrice ?? 0.0}).reduce(0.0, +)))")
                    .bold()
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                Text("3.6%")
                    .foregroundColor(Color.lightGreen)
                    .bold()
                    .font(.title3)
            }
            
            Spacer()
            
            HStack {
                
                Button {
                    print("Tapped Deposite")
                } label: {
                    Text("Deposit")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.lightGreen)
                        )
                }
                
                Spacer()
                
                Button {
                    print("Tapped Withdraw")
                } label: {
                    Text("Withdraw")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray)
                        )
                }


            }
            
            
        }
        .padding()
        .frame(height: UIScreen.main.bounds.height / 4)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.darkBlue)
        )
        .padding()
        
    }
}

//struct ValueCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ValueCardView()
//    }
//}
