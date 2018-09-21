import XCTest

class UITests: XCTestCase {
    let app = XCUIApplication()
    var oneMinuteTimer: XCUIElement!

    override func setUp() {
        continueAfterFailure = false
        app.launch()
        oneMinuteTimer = app.buttons["1"]
    }

    func testOneMinuteTimerWithImmediateClose() {
        oneMinuteTimer.tap()

        let exists = NSPredicate(format: "exists != 1")
        expectation(for: exists, evaluatedWith: oneMinuteTimer, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

        app.buttons["close button"].tap()
        XCTAssert(oneMinuteTimer.exists, "close should return to the list of timers")
    }
}
