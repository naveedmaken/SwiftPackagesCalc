import XCTest
@testable import SwiftPackagesCalc

final class SwiftPackagesCalcTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftPackagesCalc().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
