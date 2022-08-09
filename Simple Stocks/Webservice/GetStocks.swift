//
//  GetStocks.swift
//  Simple Stocks
//
//  Created by Enric Herce on 2/8/22.
//

import Foundation

struct GetStocks: WebServiceProtocol {
    func fetch(completion: @escaping ([Any]?) -> Void, errorCompletion: @escaping (String) -> Void) {
        guard let url: URL = URL(string: Global.WebserviceURL.stocks) else { return }
         URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                errorCompletion(Global.WebserviceError.errorResponse.rawValue)
                return
            }
            
            guard let data else {
                errorCompletion(Global.WebserviceError.errorData.rawValue)
                return
            }
            
            let stocks: [Stock]? = try? JSONDecoder().decode([Stock].self, from: data)
            completion(stocks)
        }.resume()
    }
}
