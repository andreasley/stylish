import Foundation

public struct Pseudo: SelectorChild  {
    
    var children: [any Renderable]
    var pseudo: String

    public init(pseudo: String, children: [any Renderable]) {
        self.children = children
        self.pseudo = pseudo
    }

    public init(_ pseudo: PseudoClass, @ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) {
        self.pseudo = pseudo.value
        self.children = builder()
    }
}

extension Pseudo {
    public func render(configuration: RenderConfiguration, level: Int = 0, parentSelector: String? = nil) -> String? {
        guard let parentSelector else { return nil }
        let fullSelectorName = parentSelector + pseudo
        return children.render(selector: fullSelectorName, configuration: configuration, level: level)
    }
}
