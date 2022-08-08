//
//  Stock.swift
//  Simple Stocks
//
//  Created by Enric Herce on 2/8/22.
//

import Foundation

struct Stock: Codable, Hashable {
    var symbol: String
    var description: String
    var price: Int
    var change: String
}
