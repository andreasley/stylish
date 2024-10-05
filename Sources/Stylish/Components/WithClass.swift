import Foundation

public struct WithClass: SelectorChild  {
    
    var children: [any Renderable]
    var className: String

    public init(name className: String, children: [any Renderable]) {
        self.children = children
        self.className = className
    }

    public init(_ className: String, @ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) {
        self.className = className
        self.children = builder()
    }
}

extension WithClass {
    public func render(configuration: RenderConfiguration, level: Int = 0, parentSelector: String? = nil) -> String {
        let spaces = String(repeating: " ", count: level * configuration.indent)
        
        var output = ""
        
        guard let parentSelector else { return "" }
        
        let fullSelectorName = parentSelector + "." + className

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
