//
//  NumberFormatterToolsTests.swift
//  NumberFormatterTools @ SwiftToolBox
//
//  Created by Igor Malyarov on 29.03.2021.
//

import Foundation
import XCTest
@testable import NumberFormatterTools

#warning("how to imitate error to get 'n/a'?")

final class NumberFormatterForIntTests: XCTestCase {
    func test_formatGrouped() {
        XCTAssertEqual(2020.formatGrouped, "2 020")
    }
    func test_formatPlain() {
        XCTAssertEqual(20202.formatPlain, "20202")
    }
}

final class NumberFormatterForDoubleTests: XCTestCase {
    func test_formatPlain() {
        XCTAssertEqual(12345.67.formatPlain, "12346")
    }
    func test_formatPercentage0() {
        XCTAssertEqual(0.67.formatPercentage0, "67 %")
        XCTAssertEqual(0.6789.formatPercentage0, "68 %")
        XCTAssertEqual(67.67.formatPercentage0, "6 767 %")
    }
    func test_formatPercentage1() {
        XCTAssertEqual(0.67.formatPercentage1, "67,0 %")
        XCTAssertEqual(0.6789.formatPercentage1, "67,9 %")
        XCTAssertEqual(67.67.formatPercentage1, "6 767,0 %")
        XCTAssertEqual(12345.67.formatPercentage1, "1 234 567,0 %")
    }
    func test_formatPercentage2() {
        XCTAssertEqual(0.67.formatPercentage2, "67,00 %")
        XCTAssertEqual(0.6789.formatPercentage2, "67,89 %")
        XCTAssertEqual(67.67.formatPercentage2, "6 767,00 %")
        XCTAssertEqual(12345.67.formatPercentage2, "1 234 567,00 %")
    }
    func test_formatDecimal0() {
        XCTAssertEqual(12345.67.formatDecimal0, "12 346")
    }
    func test_formatDecimal1() {
        XCTAssertEqual(12345.67.formatDecimal1, "12 345,7")
    }
    func test_formatDecimal2() {
        XCTAssertEqual(12345.67.formatDecimal2, "12 345,67")
    }

}

#warning("write more tests")
final class NumberFormatterTests: XCTestCase {
    func test_plain() {
        // MARK: match
        XCTAssertEqual(NumberFormatter.plain.string(for: 2_020), "2020")
        XCTAssertEqual(NumberFormatter.plain.string(for: 202_020), "202020")

        // MARK: no match
        XCTAssertNotEqual(NumberFormatter.plain.string(for: 0.5), "0.5")
    }

    func test_percentage0() {
        // MARK: match
        XCTAssertEqual(NumberFormatter.percentage0.string(for: 0.10),
                       "10 %")
        XCTAssertEqual(NumberFormatter.percentage0.string(for: 1.10),
                       "110 %")
        XCTAssertEqual(NumberFormatter.percentage0.string(for: 0.01),
                       "1 %")
        XCTAssertEqual(NumberFormatter.percentage0.string(for: 0.001),
                       "0 %")

        // MARK: no match
        XCTAssertNotEqual(NumberFormatter.percentage0.string(for: 100),
                          "100%")
    }

    func test_percentage1() {
        // MARK: match
        XCTAssertEqual(NumberFormatter.percentage1.string(for: 0.10),
                       "10,0 %")
        XCTAssertEqual(NumberFormatter.percentage1.string(for: 1.10),
                       "110,0 %")
        XCTAssertEqual(NumberFormatter.percentage1.string(for: 0.01),
                       "1,0 %")
        XCTAssertEqual(NumberFormatter.percentage1.string(for: 0.001),
                       "0,1 %")

        // MARK: no match
        XCTAssertNotEqual(NumberFormatter.percentage1.string(for: 100),
                          "100%")
    }

    func test_decimal0() {
        // MARK: match
        XCTAssertEqual(NumberFormatter.decimal0.string(for: 2_000),
                       "2 000")
        XCTAssertEqual(NumberFormatter.decimal0.string(for: 2_000.12),
                       "2 000")

        // MARK: no match
        XCTAssertNotEqual(NumberFormatter.decimal0.string(for: 2_000.123),
                          "2,000.123")
    }

    func test_decimal1() {
        // MARK: match
        XCTAssertEqual(NumberFormatter.decimal1.string(for: 2_000),
                       "2 000,0")
        XCTAssertEqual(NumberFormatter.decimal1.string(for: 2_000.12),
                       "2 000,1")

        // MARK: no match
        XCTAssertNotEqual(NumberFormatter.decimal1.string(for: 2_000.123),
                          "2,000.123")
    }

    func test_decimal2() {
        // MARK: match
        XCTAssertEqual(NumberFormatter.decimal2.string(for: 2_000),
                       "2 000,00")
        XCTAssertEqual(NumberFormatter.decimal2.string(for: 2_000.12),
                       "2 000,12")

        // MARK: no match
        XCTAssertNotEqual(NumberFormatter.decimal2.string(for: 2_000.123),
                          "2,000.123")
    }

}
