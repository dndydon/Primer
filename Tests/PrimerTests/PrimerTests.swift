import XCTest
@testable import Primer

final class PrimerTests: XCTestCase {
  
  func testExample() {
    XCTAssertEqual(Primer().text, "Hello, World!")
    
    // test the function primes() with a Combine publisher 
    let publisher = Primer().primes().publisher
    
    var string = ""
    let _ = publisher.sink(receiveValue: { value in
      string.append("received a value: \(value)")
    })
    
    XCTAssertEqual(string, "received a value: 13")
  }
  
  static var allTests = [
    ("testExample", testExample),
  ]
}
