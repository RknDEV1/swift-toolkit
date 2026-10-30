import XCTest
@testable import SwiftToolkit

final class FormattersTests: XCTestCase {

    func testCurrency() {
        let result = Formatters.currency(19.90)
        XCTAssertTrue(result.contains("19"))
        XCTAssertTrue(result.contains("90") || result.contains("9"))
    }

    func testCurrencyFromCentavos() {
        let result = Formatters.currency(fromCentavos: 1990)
        XCTAssertTrue(result.contains("19"))
    }

    func testNumber() {
        let result = Formatters.number(1234.56, fractionDigits: 2)
        XCTAssertFalse(result.isEmpty)
    }
}
