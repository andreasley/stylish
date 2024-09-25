//
//  Stylesheet.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 09..
//
public struct Stylesheet: Renderable {
    let charset: String?
    let children: [Renderable]

    public init(charset: String? = nil, @ChildBuilder<StylesheetChild> _ builder: () -> [Renderable]) {
        self.charset = charset
        self.children = builder()
    }

    public init(charset: String? = nil, _ children: [Renderable]) {
        self.charset = charset
        self.children = children
    }
    
    public init(charset: String? = nil, merging stylesheets: [Stylesheet]) {
        self.charset = charset
        self.children = stylesheets.map({ $0.children }).reduce([], +)
    }
}

extension Stylesheet {
    public func render(configuration: RenderConfiguration = .init(), level: Int = 0, parentSelector: String? = nil) -> String {
        var output = ""
        if let charset {
            output += "@charset \"\(charset)\";"
            if children.count > 0 {
                output += configuration.newline
            }
        }
        if children.count > 0 {
            output += children.map { $0.render(configuration: configuration, level: level, parentSelector: nil) }.joined(separator: configuration.newline)
        }
        return output
    }
}
