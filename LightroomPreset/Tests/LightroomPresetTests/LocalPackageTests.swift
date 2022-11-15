import XCTest
@testable import LocalPackage

final class LocalPackageTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LocalPackage().text, "Hello, World!")
    }
}
