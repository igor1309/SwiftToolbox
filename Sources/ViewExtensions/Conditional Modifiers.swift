//
//  Conditional Modifiers.swift
//  Meme-Ory
//
//  Created by Igor Malyarov on 12.12.2020.
//

import SwiftUI

#warning("how to write tests for this?")

extension View {

    // MARK: - Conditional modifiers

    @ViewBuilder
    public func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    // https://fivestars.blog/swiftui/conditional-modifiers.html
    @ViewBuilder
    public func `if`<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        if ifTransform: (Self) -> TrueContent,
        else elseTransform: (Self) -> FalseContent
    ) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }

    @ViewBuilder
    public func ifLet<V, Transform: View>(
        _ value: V?,
        transform: (Self, V) -> Transform
    ) -> some View {
        if let value = value {
            transform(self, value)
        } else {
            self
        }
    }
}
