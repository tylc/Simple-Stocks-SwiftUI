//
//  Simple_StocksUITests.swift
//  Simple StocksUITests
//
//  Created by Enric Herce on 2/8/22.
//

import XCTest

final class SimpleStocksUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func test_HomeElements () throws {
        let navBar = app.navigationBars.element
        XCTAssert(navBar.exists)
        
        let sheetButton = app.buttons["showButton"]
        XCTAssert(sheetButton.exists)
        
        let listElement = app.buttons["StockView"]
        XCTAssert(listElement.exists)
        
    }
    
    func test_SheetNavigation() throws {
        let sheetButton = app.buttons["showButton"]
        XCTAssert(sheetButton.exists)
        
        sheetButton.tap()
    }
}
