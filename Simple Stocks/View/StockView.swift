//
//  StockView.swift
//  Simple Stocks
//
//  Created by Enric Herce on 3/8/22.
//

import SwiftUI

struct StockView: View {
    var stockViewModel: StockViewModel
    var body: some View {
        HStack {
            VStack {
                Text(stockViewModel.stockNameUppercased())
                    .bold()
                Text(stockViewModel.stock.price.description)
                    .foregroundColor(.gray)
                    .padding(5)
            }
            Spacer()

            VStack {
                Text(stockViewModel.stock.description)
                    .foregroundColor(.gray)
                Text(stockViewModel.stock.change)
                    .frame(width: 70)
                    .padding(5)
                    .background(.red)
                    .cornerRadius(3.0)
            }
        }
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(stockViewModel: StockViewModel(Stock(symbol: "APPL", description: "Apple Inc.", price: 300, change: "+3.0")))
    }
}
