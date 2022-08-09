//
//  GetNewsMock.swift
//  Simple StocksTests
//
//  Created by Enric Herce on 9/8/22.
//

import Foundation

class GetNewsMock: WebServiceProtocol {
    var isWebserviceCalled = false

    func fetch(completion: @escaping ([Any]?) -> Void,
               errorCompletion: @escaping (String) -> Void) {
        guard let url: URL = URL(string: Global.WebserviceURL.news) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data {
                self.isWebserviceCalled = true
                completion(nil)
            } else {
                self.isWebserviceCalled = false
                errorCompletion("error")
            }
        }
    }
}
