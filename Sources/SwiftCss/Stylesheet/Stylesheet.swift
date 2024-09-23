//
//  Stylesheet.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 09..
//

public struct Stylesheet {
    let children: [StylesheetChild]

    public init(@StylesheetChildBuilder _ builder: () -> [StylesheetChild]) {
        self.children = builder()
    }

    public init(_ children: [StylesheetChild]) {
        self.children = children
    }
}
