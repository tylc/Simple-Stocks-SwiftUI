//
//  GetNews.swift
//  Simple Stocks
//
//  Created by Enric Herce on 2/8/22.
//

import Foundation

struct GetNews {
    func getNews (completion:@escaping([New]?) -> Void,
                  errorCompletion: @escaping(String) -> Void) {
        guard let url = URL(string: Global.WebserviceURL.news) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                errorCompletion(Global.WebserviceError.errorResponse.rawValue)
                return
            }
            guard let data = data else {
                errorCompletion(Global.WebserviceError.errorData.rawValue)
                return
            }
            completion(news)
        }.resume()
    }
}

/* tricks:
 do {
     let decoder = JSONDecoder()
     let messages = try decoder.decode([Stock].self, from: data)
     print(messages as Any)
 } catch DecodingError.dataCorrupted(let context) {
     print(context)
 } catch DecodingError.keyNotFound(let key, let context) {
     print("Key '\(key)' not found:", context.debugDescription)
     print("codingPath:", context.codingPath)
 } catch DecodingError.valueNotFound(let value, let context) {
     print("Value '\(value)' not found:", context.debugDescription)
     print("codingPath:", context.codingPath)
 } catch DecodingError.typeMismatch(let type, let context) {
     print("Type '\(type)' mismatch:", context.debugDescription)
     print("codingPath:", context.codingPath)
 } catch {
     print("error: ", error)
 }
 let news: [New]? = try? JSONDecoder().decode([New].self, from: data)
 */
