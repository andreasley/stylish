//
//  Keyframes.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 24..
//

public struct Keyframes: Rule {
    
    var name: String
    var selectors: [Selector]

    public init(_ name: String, @ChildBuilder<Selector> _ builder: () -> [Selector]) {
        self.name = name
        self.selectors = builder()
    }
}

extension Keyframes {
    public func render(configuration: RenderConfiguration, level: Int, parentSelector: String?) -> String {
        let selectors = selectors.map { $0.render(configuration: configuration, level: level + 1, parentSelector: nil) }.joined(separator: configuration.newline)
        return "@keyframes " + name + configuration.singleSpace + "{" + configuration.newline + selectors + configuration.newline + "}" + configuration.newline
    }
}
