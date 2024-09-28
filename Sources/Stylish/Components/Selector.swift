//
//  Selector.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 09..
//

/// https://www.w3schools.com/cssref/css_selectors.asp

public struct Selector: StylesheetChild, SelectorChild, RuleChild  {
    public typealias T = Stylesheet
    
    var name: String
    var children: [any Renderable]
    var pseudo: String? = nil

    public init(name: String, children: [any Renderable], pseudo: String? = nil) {
        self.name = name
        self.children = children
        self.pseudo = pseudo
    }

    public init(_ name: String, @ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) {
        self.name = name
        self.children = builder()
    }
}

extension Selector {
    public func render(configuration: RenderConfiguration, level: Int = 0, parentSelector: String? = nil) -> String {
        let spaces = String(repeating: " ", count: level * configuration.indent)
        var suffix = ""
        if let pseudo {
            suffix = pseudo
        }
        
        var output = ""
        let fullSelectorName: String
        if let parentSelector {
            fullSelectorName = parentSelector + " " + self.name + suffix
        } else {
            fullSelectorName = self.name + suffix
        }
        
        let properties = children.filter { $0 is Property }
        if properties.count > 0 {
            let renderedProperties = properties.map { $0.render(configuration: configuration, level: level + 1, parentSelector: fullSelectorName) }.joined(separator: ";" + configuration.newline) + (!configuration.minify ? ";" : "")
            output += spaces + fullSelectorName + configuration.singleSpace + "{" + configuration.newline + renderedProperties + configuration.newline + spaces + "}"
        }
        
        let nestedSelectors = children.filter { !($0 is Property) }
        if nestedSelectors.count > 0 {
            if output != "" {
                output += configuration.newline
            }
            output += nestedSelectors.map { $0.render(configuration: configuration, level: level, parentSelector: fullSelectorName) }.joined(separator: configuration.newline)
        }

        return output
    }
}
