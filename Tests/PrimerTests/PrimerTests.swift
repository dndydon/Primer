import XCTest
@testable import Primer

final class PrimerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Primer().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
