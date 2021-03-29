//
//  NumberFormatter+Ext.swift
//  RFin
//
//  Created by Igor Malyarov on 24.03.2021.
//

import Foundation

#warning("write tests for this")

public extension Int {
    var formatGrouped: String { NumberFormatter.decimal0.string(for: self) ?? "n/a" }
    var formatPlain: String { NumberFormatter.plain.string(for: self) ?? "n/a" }
}

public extension Double {
    var formatPlain: String { NumberFormatter.plain.string(for: self) ?? "n/a" }

    var formatPercentage0: String { NumberFormatter.percentage0.string(for: self) ?? "n/a" }
    var formatPercentage1: String { NumberFormatter.percentage1.string(for: self) ?? "n/a" }
    var formatPercentage2: String { NumberFormatter.percentage2.string(for: self) ?? "n/a" }

    var formatDecimal0: String { NumberFormatter.decimal0.string(for: self) ?? "n/a" }
    var formatDecimal1: String { NumberFormatter.decimal1.string(for: self) ?? "n/a" }
    var formatDecimal2: String { NumberFormatter.decimal2.string(for: self) ?? "n/a" }
}

extension NumberFormatter {
    static let plain: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.usesGroupingSeparator = false
        formatter.maximumFractionDigits = 0
        return formatter
    }()

    static let percentage0: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0
        return formatter
    }()
    static let percentage1: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        return formatter
    }()
    static let percentage2: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }()

    static let decimal0: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0
        return formatter
    }()
    static let decimal1: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        return formatter
    }()
    static let decimal2: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }()
}
