//
//  Property.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 09..
//

/// https://www.w3schools.com/cssref/
public struct Property: SelectorChild {
    public var name: String
    public var value: String
    var isImportant: Bool = false
    
    public init(name: String, value: String, isImportant: Bool = false) {
        self.name = name
        self.value = value
        self.isImportant = isImportant
    }

    public func important() -> Property {
        guard !isImportant else {
            return self
        }
        return Property(name: name, value: value, isImportant: true)
    }
}

extension Property {
    public func render(configuration: RenderConfiguration, level: Int, parentSelector: String?) -> String? {
        let spaces = String(repeating: " ", count: level * configuration.indent)
        return spaces + name + ":" + configuration.singleSpace + value + (isImportant ? " !important" : "")
    }
}
