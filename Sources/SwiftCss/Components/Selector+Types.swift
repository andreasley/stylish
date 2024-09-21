//
//  Selector+Types.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 10..
//

public func Root(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Selector(":root", builder)
}

public func All(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Selector("*", builder)
}

public func Element(_ name: HTMLElement, @PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Selector(name.rawValue, builder)
}

public func Elements(_ names: [HTMLElement], @PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Selector(names.map(\.rawValue).joined(separator: ","), builder)
}

public func Id(_ name: String, @PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Selector("#" + name, builder)
}

public func Class(_ name: String, @PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Selector("." + name, builder)
}

public func Html(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.html, builder)
}

public func Body(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.body, builder)
}

public func Address(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.address, builder)
}

public func Article(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.article, builder)
}

public func Aside(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.aside, builder)
}

public func Footer(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.footer, builder)
}

public func Header(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.header, builder)
}

public func H1(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h1, builder)
}

public func H2(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h2, builder)
}

public func H3(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h3, builder)
}

public func H4(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h4, builder)
}

public func H5(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h5, builder)
}

public func H6(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h6, builder)
}

public func Main(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.main, builder)
}

public func Nav(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.nav, builder)
}

public func Section(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.section, builder)
}

public func Blockquote(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.blockquote, builder)
}

public func Dd(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.dd, builder)
}

public func Div(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.div, builder)
}

public func Dl(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.dl, builder)
}

public func Dt(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.dt, builder)
}

public func Figcaption(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.figcaption, builder)
}

public func Figure(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.figure, builder)
}

public func Hr(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.hr, builder)
}

public func Li(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.li, builder)
}

public func Ol(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.ol, builder)
}

public func P(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.p, builder)
}

public func Pre(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.pre, builder)
}

public func Ul(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.ul, builder)
}

public func A(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.a, builder)
}

public func Abbr(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.abbr, builder)
}

public func B(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.b, builder)
}

public func Bdi(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.bdi, builder)
}

public func Bdo(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.bdo, builder)
}

public func Br(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.br, builder)
}

public func Cite(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.cite, builder)
}

public func Code(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.code, builder)
}

public func Data(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.data, builder)
}

public func Dfn(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.dfn, builder)
}

public func Em(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.em, builder)
}

public func I(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.i, builder)
}

public func Kbd(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.kbd, builder)
}

public func Mark(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.mark, builder)
}

public func Q(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.q, builder)
}

public func Ruby(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.ruby, builder)
}

public func S(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.s, builder)
}

public func Samp(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.samp, builder)
}

public func Small(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.small, builder)
}

public func Span(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.span, builder)
}

public func Strong(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.strong, builder)
}

public func Sub(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.sub, builder)
}

public func Sup(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.sup, builder)
}

public func Time(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.time, builder)
}

public func U(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.u, builder)
}

public func Var(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.var, builder)
}

public func Wbr(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.wbr, builder)
}

public func Area(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.area, builder)
}

public func Audio(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.html, builder)
}

public func Img(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.img, builder)
}

public func Map(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.map, builder)
}

public func Track(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.track, builder)
}

public func Video(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.video, builder)
}

public func Embed(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.embed, builder)
}

public func Iframe(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.iframe, builder)
}

public func Object(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.object, builder)
}

public func Param(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.param, builder)
}

public func Picture(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.picture, builder)
}

public func Portal(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.portal, builder)
}

public func Source(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.source, builder)
}

public func Svg(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.svg, builder)
}

public func Math(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.math, builder)
}

public func Canvas(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.canvas, builder)
}

public func Noscript(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.noscript, builder)
}

public func Script(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.script, builder)
}

public func Del(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.del, builder)
}

public func Ins(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.ins, builder)
}

public func Caption(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.caption, builder)
}

public func Col(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.col, builder)
}

public func Colgroup(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.colgroup, builder)
}

public func Table(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.table, builder)
}

public func Tbody(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.tbody, builder)
}

public func Td(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.td, builder)
}

public func Tfoot(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.tfoot, builder)
}

public func Th(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.th, builder)
}

public func Thead(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.thead, builder)
}

public func Tr(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.tr, builder)
}

public func Button(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.button, builder)
}

public func Datalist(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.datalist, builder)
}

public func Fieldset(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.fieldset, builder)
}

public func Form(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.form, builder)
}

public func Input(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.input, builder)
}

public func Label(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.label, builder)
}

public func Legend(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.legend, builder)
}

public func Meter(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.meter, builder)
}

public func Optgroup(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.optgroup, builder)
}

public func Option(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.option, builder)
}

public func Output(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.output, builder)
}

public func Progress(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.progress, builder)
}

public func Select(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.select, builder)
}

public func Textarea(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.textarea, builder)
}

public func Details(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.details, builder)
}

public func Dialog(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.dialog, builder)
}

public func Menu(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.menu, builder)
}

public func Summary(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.summary, builder)
}

public func Slot(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.slot, builder)
}

public func Template(@PropertyBuilder _ builder: () -> [SelectorChild]) -> Selector {
    Element(.template, builder)
}
