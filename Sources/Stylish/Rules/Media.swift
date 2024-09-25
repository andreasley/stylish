//
//  Media.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 09..
//

public struct Media: Rule {

    public enum Screen: String {
        /// 0-599px
        case xs = "screen and (max-width: 599px)"
        /// 600-899px
        case s = "screen and (min-width: 600px)"
        /// 900-1199px
        case normal = "screen and (min-width: 900px)"
        /// 1200-1799px
        case l = "screen and (min-width: 1200px)"
        /// 1800+px
        case xl = "screen and (min-width: 1800px)"
        /// dark mode
        case dark = "screen and (prefers-color-scheme: dark)"
        /// standalone app screen
        case standalone = "screen and (display-mode: standalone)"
    }

    var query: String?
    var children: [RuleChild]

    public init(_ query: String? = nil, @ChildBuilder<RuleChild> _ builder: () -> [RuleChild]) {
        self.query = query
        self.children = builder()
    }
    
    public init(screen: Screen, @ChildBuilder<RuleChild> _ builder: () -> [RuleChild]) {
        self.init(screen.rawValue, builder)
    }    
}

extension Media {
    public func render(configuration: RenderConfiguration, level: Int, parentSelector: String?) -> String {
        let level = query != nil ? 1 : 0
        var output = children.map { $0.render(configuration: configuration, level: level, parentSelector: nil) }.joined(separator: configuration.newline)
        if let query = query {
            output = "@media " + query + configuration.singleSpace + "{" + configuration.newline + output + configuration.newline + "}"
        }
        return output
    }
}
