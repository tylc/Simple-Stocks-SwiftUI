//
//  WebserviceProtocol.swift
//  Simple Stocks
//
//  Created by Enric Herce on 9/8/22.
//

import Foundation

protocol WebServiceProtocol {
    func fetch (completion:@escaping([Any]?) -> Void, errorCompletion: @escaping(String) -> Void)
}
