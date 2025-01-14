import Foundation

public struct Attribute: StylesheetChild, SelectorChild, RuleChild  {
    
    public enum AttributeValue: Sendable {
        case exists
        case matches(_ value: String)
        case contains(_ value: String)
        case hasPrefix(_ value: String)
        case hasSuffix(_ value: String)
        case containsWord(_ value: String)
        case hasLanguageSubcode(_ value: String)
    }

    public enum TextComparison: Sendable {
        case caseInsensitive
        @available(*, deprecated, message: "Lacking browser support")
        case caseSensitive
    }

    let children: [any Renderable]
    let name: String
    let value: AttributeValue
    let comparison: TextComparison?

    public init(_ name: String, _ value: AttributeValue = .exists, comparison: TextComparison? = nil, children: [any Renderable]) {
        self.children = children
        self.name = name
        self.value = value
        self.comparison = comparison
    }

    public init(_ name: String, _ value: AttributeValue = .exists, comparison: TextComparison? = nil, @ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) {
        self.children = builder()
        self.name = name
        self.value = value
        self.comparison = comparison
    }
}

extension Attribute {
    public func render(configuration: RenderConfiguration, level: Int = 0, parentSelector: String? = nil) -> String? {
        
        func quoted(_ value: String) -> String {
            "\"" + value + "\""
        }
        
        let attribute: String = switch self.value {
        case .exists:
            name
        case .matches(let value):
            name + "=" + quoted(value)
        case .contains(let value):
            name + "*=" + quoted(value)
        case .hasPrefix(let value):
            name + "^=" + quoted(value)
        case .hasSuffix(let value):
            name + "$=" + quoted(value)
        case .containsWord(let value):
            name + "~=" + quoted(value)
        case .hasLanguageSubcode(let value):
            name + "|=" + quoted(value)
        }
        
        let comparison: String = switch self.comparison {
        case .caseInsensitive:
            " i"
        case .caseSensitive:
            " s"
        case .none:
            ""
        }
        
        let fullSelectorName = (parentSelector ?? "") + "[" + attribute + comparison + "]"
        return children.render(selector: fullSelectorName, configuration: configuration, level: level)
    }
}
