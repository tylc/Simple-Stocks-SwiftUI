//
//  StockListViewModel.swift
//  Simple Stocks
//
//  Created by Enric Herce on 3/8/22.
//

import Foundation

protocol StockListViewModelOutputs {
    func numerOfItems() -> Int
    func item(at index: Int) -> Stock?
}

class StockListViewModel: StockListViewModelOutputs, ObservableObject {
    var getStocks: GetStocks
    
    @Published var stockViewModels: [StockViewModel]
    @Published var stockList: [Stock]?
    @Published var searchTerm: String = ""
        
    init() {
        getStocks = GetStocks()
        stockViewModels = [StockViewModel]()
        
        fetchStocks()
    }
    
    private func fetchStocks() {
            getStocks.getStocks(completion: { value in
                DispatchQueue.main.async {
                    self.stockList = value
                    // TODO: create and add viewModels
                    self.stockList?.map {
                        self.stockViewModels.append(StockViewModel($0))
                    }
                }
            }, errorCompletion: {_ in
                print ("error, handle is a must. But we'll do it later")
            })
    }
    
    // MARK: StockListViewModelOutputs
    
    func numerOfItems() -> Int {
        return self.stockList?.count ?? 0
    }
    
    func item(at index: Int) -> Stock? {
        return self.stockList?[index] ?? nil
    }

}
