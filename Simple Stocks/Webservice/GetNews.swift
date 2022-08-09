//
//  GetNews.swift
//  Simple Stocks
//
//  Created by Enric Herce on 2/8/22.
//

import Foundation

struct GetNews: WebServiceProtocol {
    func fetch (completion:@escaping([Any]?) -> Void, errorCompletion: @escaping(String) -> Void) {
        
        guard let url: URL = URL(string: Global.WebserviceURL.news) else { return }
         URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                errorCompletion(Global.WebserviceError.errorResponse.rawValue)
                return
            }
            
            guard let data else {
                errorCompletion(Global.WebserviceError.errorData.rawValue)
                return
            }
            
            let news: [New]? = try? JSONDecoder().decode([New].self, from: data)
            completion(news)
        }.resume()
    }
}
