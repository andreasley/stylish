//
//  Bottom.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 10..
//

public enum BottomValue {
    /// Lets the browser calculate the bottom edge position. This is default
    case auto
    /// Sets the bottom edge position in px, cm, etc. Negative values are allowed. Read about length units
    case length(Unit)
    /// Sets this property to its default value.
    case initial
    /// Inherits this property from its parent element.
    case inherit

    var rawValue: String {
        switch self {
        case .auto:
            return "auto"
        case .length(let value):
            return value.rawValue
        case .initial:
            return "initial"
        case .inherit:
            return "inherit"
        }
    }
}

public func Bottom(_ value: String) -> Property {
    Property(name: "bottom", value: value)
}

/// Sets the elements position, from the bottom of its parent element
public func Bottom(_ value: BottomValue = .auto) -> Property {
    Bottom(value.rawValue)
}

/// Sets the elements position, from the bottom of its parent element
public func Bottom(_ value: Unit) -> Property {
    Bottom(.length(value))
}
