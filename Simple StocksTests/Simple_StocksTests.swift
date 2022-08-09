//
//  Simple_StocksTests.swift
//  Simple StocksTests
//
//  Created by Enric Herce on 2/8/22.
//

import XCTest
@testable import Simple_Stocks

final class SimpleStocksTests: XCTestCase {
    var getStocksMock = GetStocksMock()
    var getNewsMock = GetStocksMock()

    func test_getStocksVM() throws {
        getStocksMock.fetch(completion: { _ in
            XCTAssertEqual(self.getStocksMock.isWebserviceCalled, true)
        }, errorCompletion: { _ in
            XCTAssertEqual(self.getStocksMock.isWebserviceCalled, false)
        })
    }
    
    func test_getNewsVM() throws {
        getNewsMock.fetch(completion: { _ in
            XCTAssertEqual(self.getNewsMock.isWebserviceCalled, true)
        }, errorCompletion: { _ in
            XCTAssertEqual(self.getNewsMock.isWebserviceCalled, false)
        })
    }
}
