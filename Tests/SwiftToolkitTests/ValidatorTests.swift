import XCTest
@testable import SwiftToolkit

final class ValidatorTests: XCTestCase {

    func testValidEmail() {
        XCTAssertTrue(Validator.isValidEmail("user@example.com"))
        XCTAssertTrue(Validator.isValidEmail("user.name+tag@domain.co"))
    }

    func testInvalidEmail() {
        XCTAssertFalse(Validator.isValidEmail(""))
        XCTAssertFalse(Validator.isValidEmail("plainaddress"))
        XCTAssertFalse(Validator.isValidEmail("@missinguser.com"))
        XCTAssertFalse(Validator.isValidEmail("user@.com"))
    }

    func testValidCPF() {
        // Valid CPF example (known valid check digits)
        XCTAssertTrue(Validator.isValidCPF("390.533.447-05"))
        XCTAssertTrue(Validator.isValidCPF("39053344705"))
    }

    func testInvalidCPF() {
        XCTAssertFalse(Validator.isValidCPF("00000000000"))
        XCTAssertFalse(Validator.isValidCPF("11111111111"))
        XCTAssertFalse(Validator.isValidCPF("123"))
        XCTAssertFalse(Validator.isValidCPF("12345678900"))
    }
}
