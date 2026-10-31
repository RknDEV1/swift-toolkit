import XCTest
@testable import SwiftToolkit

final class CollectionExtensionsTests: XCTestCase {

    func testIsNotEmpty() {
        XCTAssertTrue([1, 2].isNotEmpty)
        XCTAssertFalse([Int]().isNotEmpty)
    }

    func testSafeSubscript() {
        let array = ["a", "b", "c"]
        XCTAssertEqual(array[safe: 0], "a")
        XCTAssertEqual(array[safe: 2], "c")
        XCTAssertNil(array[safe: 3])
        XCTAssertNil(array[safe: -1])
    }
}
