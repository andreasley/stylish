//
//  FontFace.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 24..
//

public struct FontFace: StylesheetChild, RuleChild {
    var properties: [Property]

    public init(@ChildBuilder<Property> _ builder: () -> [Property]) {
        self.properties = builder()
    }
}

extension FontFace {
    public func render(configuration: RenderConfiguration, level: Int, parentSelector: String?) -> String {
        let properties = properties.map { $0.render(configuration: configuration, level: level + 1, parentSelector: nil) }.joined(separator: ";" + configuration.newline)
        let spaces = String(repeating: " ", count: level * configuration.indent)
        return spaces + "@font-face {" + configuration.newline + properties + (!configuration.minify ? ";" : "") + configuration.newline + spaces + "}"
    }
}
