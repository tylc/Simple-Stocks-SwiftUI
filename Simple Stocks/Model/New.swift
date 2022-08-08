//
//  New.swift
//  Simple Stocks
//
//  Created by Enric Herce on 2/8/22.
//

import Foundation

struct New: Codable, Hashable {
    var title: String
    var publication: String
    var imageUrlString: String
    
    enum CodingKeys: String, CodingKey {
            case title
            case publication
            case imageUrlString = "imageURL"
        }
}
