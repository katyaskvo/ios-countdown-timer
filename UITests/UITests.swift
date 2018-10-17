import XCTest

class UITests: XCTestCase {
    let app = XCUIApplication()
    var oneMinuteTimer: XCUIElement!

    override func setUp() {
        continueAfterFailure = false
        app.launch()
        oneMinuteTimer = app.buttons["7"]
    }

    fileprivate func waitToDisappear(_ element: XCUIElement) {
        let exists = NSPredicate(format: "exists != 1")
        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testOneMinuteTimerWithImmediateClose() {
        oneMinuteTimer.tap()

        waitToDisappear(oneMinuteTimer)

        app.buttons["close button"].tap()
        XCTAssert(oneMinuteTimer.exists, "close should return to the list of timers")
    }
}
