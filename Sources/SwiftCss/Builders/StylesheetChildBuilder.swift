//
//  RuleBuilder.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 09..
//

@resultBuilder
public enum StylesheetChildBuilder {
    public static func buildBlock(_ components: StylesheetChild...) -> [StylesheetChild] {
        components
    }
    
    public static func buildBlock(_ components: [StylesheetChild]) -> [StylesheetChild] {
        components
    }
    
    public static func buildBlock(_ components: [StylesheetChild]...) -> [StylesheetChild] {
        components.flatMap { $0 }
    }

    public static func buildEither(first component: [StylesheetChild]) -> [StylesheetChild] {
        component
    }

    public static func buildEither(second component: [StylesheetChild]) -> [StylesheetChild] {
        component
    }

    public static func buildOptional(_ component: [StylesheetChild]?) -> [StylesheetChild] {
        component ?? []
    }

    public static func buildExpression(_ expression: StylesheetChild) -> [StylesheetChild] {
        [expression]
    }

    public static func buildExpression(_ expression: [StylesheetChild]) -> [StylesheetChild] {
        expression
    }

    public static func buildArray(_ components: [[StylesheetChild]]) -> [StylesheetChild] {
        components.flatMap { $0 }
    }
}
