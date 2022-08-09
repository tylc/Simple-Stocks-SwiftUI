//
//  AppContants.swift
//  Simple Stocks
//
//  Created by Enric Herce on 2/8/22.
//

import Foundation

enum Global {
    enum WebserviceURL {
        static let stocks: String = "https://island-bramble.glitch.me/stocks"
        static let news: String = "https://island-bramble.glitch.me/top-news"
    }
    
    enum WebserviceError: String {
        case errorResponse = "Error in the query"
        case errorData = "Error while receiving data"
    }
    
    enum DownloadError: Error {
      case statusNotOk
      case decoderError
    }
}
