//
//  GetStocks.swift
//  Simple Stocks
//
//  Created by Enric Herce on 2/8/22.
//

import Foundation

struct GetStocks {
    // func getStocks (completion: @escaping ([Stock]?) -> Void) async throws {
    
    func getStocks (completion:@escaping([Stock]?) -> Void, errorCompletion: @escaping(String) -> Void) {
        guard let url: URL = URL(string: Global.WebserviceURL.stocks) else { return }
        // old way
        
         URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                errorCompletion(Global.WebserviceError.errorResponse.rawValue)
                return
            }
            
            guard let data = data else {
                errorCompletion(Global.WebserviceError.errorData.rawValue)
                return
            }
            
            let stocks: [Stock]? = try? JSONDecoder().decode([Stock].self, from: data)
            completion(stocks)
        }.resume()
    }
}
