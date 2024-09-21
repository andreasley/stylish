//
//  PropertyBuilder.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 09..
//

@resultBuilder
public enum PropertyBuilder {
    public static func buildBlock(_ components: SelectorChild...) -> [SelectorChild] {
        components
    }
    
    public static func buildBlock(_ components: [SelectorChild]) -> [SelectorChild] {
        components
    }
    
    public static func buildBlock(_ components: [SelectorChild]...) -> [SelectorChild] {
        components.flatMap { $0 }
    }

    public static func buildEither(first component: [SelectorChild]) -> [SelectorChild] {
        component
    }

    public static func buildEither(second component: [SelectorChild]) -> [SelectorChild] {
        component
    }

    public static func buildOptional(_ component: [SelectorChild]?) -> [SelectorChild] {
        component ?? []
    }

    public static func buildExpression(_ expression: SelectorChild) -> [SelectorChild] {
        [expression]
    }

    public static func buildExpression(_ expression: [SelectorChild]) -> [SelectorChild] {
        expression
    }

    public static func buildArray(_ components: [[SelectorChild]]) -> [SelectorChild] {
        components.flatMap { $0 }
    }
}
