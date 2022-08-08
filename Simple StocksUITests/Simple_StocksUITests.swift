//
//  Simple_StocksUITests.swift
//  Simple StocksUITests
//
//  Created by Enric Herce on 2/8/22.
//

import XCTest

final class SimpleStocksUITests: XCTestCase {

    //Here we define the app and launch in setup method 
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    //Static texts check
    /*
    func testWelcome() throws {
        //In the third line we’re accessing all static tests in the running app instance. We’re asking for the one having the “Welcome!” content. The returned value is a XCUIElement object assigned to the welcome constant.
     
        let welcome = app.staticTexts["Welcome!"]
     
        XCTAssert(welcome.exists)
    }
     */
    
    //Button test
    /*
     
     Even though the above is a simple and straightforward test that will undoubtedly succeed, there is no guarantee that things will remain the same in the future in real world conditions. For example, the button’s text might change, or even more, to be replaced by an image, or by both an image and a text.

     To make tests more robust and unaffected by changes that may happen on the button’s label, we can set an explicit accessibility identifier to the button, and use that as a subscript in order to access the button in the buttons array.

     Note: UI testing is based on accessibility, so the more accessibility features you add to your app, the easier will be to write UI tests.

     Let’s do that, so open the ContentView.swift file and add the next line right after the button’s implementation:

     ContentView
     Button(
         ...
     )
     .accessibilityIdentifier("loginButton")
     
    func testLoginButton() throws {
        let login = app.buttons["loginButton"]
     
        XCTAssert(login.exists)
    }
    */
}
