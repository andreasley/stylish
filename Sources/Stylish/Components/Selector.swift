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
        var suffix = ""
        if let pseudo {
            suffix = pseudo
        }
        
        let fullSelectorName: String
        if let parentSelector {
            fullSelectorName = parentSelector + " " + self.name + suffix
        } else {
            fullSelectorName = self.name + suffix
        }
        
        return children.render(selector: fullSelectorName, configuration: configuration, level: level)
    }
}
