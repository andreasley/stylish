public protocol Renderable {
    func render(configuration: RenderConfiguration, level: Int, parentSelector: String?) -> String
}

extension Array where Element == any Renderable {
    public func render(selector: String, configuration: RenderConfiguration, level: Int) -> String {
        let spaces = String(repeating: " ", count: level * configuration.indent)
        
        var output = ""
        
        let properties = self.filter { $0 is Property }
        if properties.count > 0 {
            let renderedProperties = properties.map { $0.render(configuration: configuration, level: level + 1, parentSelector: selector) }.joined(separator: ";" + configuration.newline) + (!configuration.minify ? ";" : "")
            output += spaces + selector + configuration.singleSpace + "{" + configuration.newline + renderedProperties + configuration.newline + spaces + "}"
        }
        
        let nestedSelectors = self.filter { !($0 is Property) }
        if nestedSelectors.count > 0 {
            if output != "" {
                output += configuration.newline
            }
            output += nestedSelectors.map { $0.render(configuration: configuration, level: level, parentSelector: selector) }.joined(separator: configuration.newline)
        }

        return output
    }
}
