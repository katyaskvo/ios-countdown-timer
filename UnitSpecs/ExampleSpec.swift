import Quick
import Nimble

class ExampleSpec: QuickSpec {
    override func spec() {
        describe("test framework installation") {
            context("obvious test") {
                it("should be successfull") {
                    expect(1 + 1) == 2
                }
            }
        }
    }
}
