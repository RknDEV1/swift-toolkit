import XCTest
@testable import SwiftToolkit

final class StringExtensionsTests: XCTestCase {

    func testIsBlank() {
        XCTAssertTrue("".isBlank)
        XCTAssertTrue("   ".isBlank)
        XCTAssertTrue("\n\t".isBlank)
        XCTAssertFalse("hello".isBlank)
        XCTAssertFalse(" a ".isBlank)
    }

    func testTrimmed() {
        XCTAssertEqual("  hello  ".trimmed, "hello")
        XCTAssertEqual("\nworld\t".trimmed, "world")
        XCTAssertEqual("already".trimmed, "already")
    }

    func testOptionalIsNilOrBlank() {
        let nilString: String? = nil
        let blankString: String? = "   "
        let validString: String? = "ok"

        XCTAssertTrue(nilString.isNilOrBlank)
        XCTAssertTrue(blankString.isNilOrBlank)
        XCTAssertFalse(validString.isNilOrBlank)
    }
}
