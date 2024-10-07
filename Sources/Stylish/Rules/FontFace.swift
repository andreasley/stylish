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
    public func render(configuration: RenderConfiguration, level: Int, parentSelector: String?) -> String? {
        let renderedProperties = properties.compactMap { $0.render(configuration: configuration, level: level + 1, parentSelector: nil) }.joined(separator: ";" + configuration.newline)
        let spaces = String(repeating: " ", count: level * configuration.indent)
        
        guard !renderedProperties.isEmpty else { return nil }
        return spaces + "@font-face {" + configuration.newline + renderedProperties + (!configuration.minify ? ";" : "") + configuration.newline + spaces + "}"
    }
}
