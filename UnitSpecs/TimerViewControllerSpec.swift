import Quick
import Nimble
@testable import CountdownTimer

class TimerViewControllerSpec: QuickSpec {
    override func spec() {
        describe("Timer View Controller") {
            context("prepare for segue") {
                it("should set properties for countdown view controller") {
                    let subject = TimerViewController()
                    let destination = CountDownViewController()
                    let segue = UIStoryboardSegue(identifier: "any",
                                                  source: subject,
                                                  destination: destination)
                    let button = RoundButton()
                    button.setTitle("7", for: .normal)
                    button.backgroundColor = .blue
                    subject.prepare(for: segue, sender: button)

                    expect(destination.numberOfSeconds) == 420
                    expect(destination.circleColor) == .blue
                    expect(destination.circleSize) == 0.79
                }
            }
        }
    }
}
