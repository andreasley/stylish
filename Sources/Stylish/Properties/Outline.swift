//
//  Outline.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 10..
//

public enum OutlineValue {
    /// outline-width    Specifies the width of outline
    /// outline-style    Specifies the style of the outline
    /// outline-color    Specifies the color of the outline
    case values(OutlineWidthValue, OutlineStyleValue, OutlineColorValue)
    /// outline-style    Specifies the style of the outline
    /// outline-color    Specifies the color of the outline
    case styleAndColor(OutlineStyleValue, OutlineColorValue)
    /// Sets this property to its default value.
    case initial
    /// Inherits this property from its parent element.
    case inherit

    var rawValue: String {
        switch self {
        case let .values(width, style, color):
            return [width.rawValue, style.rawValue, color.rawValue].joined(separator: " ")
        case let .styleAndColor(style, color):
            return [style.rawValue, color.rawValue].joined(separator: " ")
        case .initial:
            return "initial"
        case .inherit:
            return "inherit"
        }
    }
}

public func Outline(_ value: String) -> Property {
    Property(name: "outline", value: value)
}

/// A shorthand property for the outline-width, outline-style, and the outline-color properties
public func Outline(_ value: OutlineValue) -> Property {
    Outline(value.rawValue)
}

/// A shorthand property for the outline-style property
public func Outline(_ style: OutlineStyleValue) -> Property {
    Outline(style.rawValue)
}

/// A shorthand property for the outline-style property
public func Outline(_ style: OutlineStyleValue, color: OutlineColorValue) -> Property {
    Outline(.styleAndColor(style, color))
}
