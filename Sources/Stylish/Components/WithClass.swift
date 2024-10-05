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
        guard let parentSelector else { return "" }
        let fullSelectorName = parentSelector + "." + className
        return children.render(selector: fullSelectorName, configuration: configuration, level: level)
    }
}
