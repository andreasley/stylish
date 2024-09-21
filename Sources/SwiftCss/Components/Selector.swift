//
//  Selector.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 09..
//

/// https://www.w3schools.com/cssref/css_selectors.asp
public struct Selector: SelectorChild {
    var name: String
    var children: [SelectorChild]
    var pseudo: String? = nil

    public init(name: String, children: [SelectorChild], pseudo: String? = nil) {
        self.name = name
        self.children = children
        self.pseudo = pseudo
    }

    public init(_ name: String, @PropertyBuilder _ builder: () -> [SelectorChild]) {
        self.name = name
        self.children = builder()
    }
}
