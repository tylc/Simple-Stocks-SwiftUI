//
//  StockViewModel.swift
//  Simple Stocks
//
//  Created by Enric Herce on 3/8/22.
//

import Foundation

protocol StockViewModelOutputs {
    func stockNameUppercased() -> String
}

class StockViewModel: StockViewModelOutputs, ObservableObject, Hashable {
    
    var identifier: String {
            return UUID().uuidString
        }
        
        public func hash(into hasher: inout Hasher) {
            return hasher.combine(identifier)
        }
        
        public static func == (lhs: StockViewModel, rhs: StockViewModel) -> Bool {
            return lhs.identifier == rhs.identifier
        }
    
    @Published var stock: Stock
    
    init(_ stock: Stock) {
        self.stock = stock
    }
    
    // MARK: StockViewModelOutputs
    
    func stockNameUppercased() -> String {
        return stock.symbol.uppercased()
    }
    
}
