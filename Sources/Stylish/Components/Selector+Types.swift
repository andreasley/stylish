//
//  Selector+Types.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 10..
//

public func Root(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Selector(":root", builder)
}

public func All(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Selector("*", builder)
}

public func Element(_ name: HTMLElement, @ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Selector(name.rawValue, builder)
}

public func Elements(_ names: [HTMLElement], @ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Selector(names.map(\.rawValue).joined(separator: ","), builder)
}

public func Id(_ name: String, @ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Selector("#" + name, builder)
}

public func Class(_ name: String, @ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Selector("." + name, builder)
}

public func Html(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.html, builder)
}

public func Body(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.body, builder)
}

public func Address(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.address, builder)
}

public func Article(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.article, builder)
}

public func Aside(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.aside, builder)
}

public func Footer(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.footer, builder)
}

public func Header(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.header, builder)
}

public func H1(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h1, builder)
}

public func H2(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h2, builder)
}

public func H3(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h3, builder)
}

public func H4(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h4, builder)
}

public func H5(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h5, builder)
}

public func H6(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.h6, builder)
}

public func Main(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.main, builder)
}

public func Nav(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.nav, builder)
}

public func Section(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.section, builder)
}

public func Blockquote(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.blockquote, builder)
}

public func Dd(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.dd, builder)
}

public func Div(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.div, builder)
}

public func Dl(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.dl, builder)
}

public func Dt(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.dt, builder)
}

public func Figcaption(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.figcaption, builder)
}

public func Figure(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.figure, builder)
}

public func Hr(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.hr, builder)
}

public func Li(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.li, builder)
}

public func Ol(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.ol, builder)
}

public func P(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.p, builder)
}

public func Pre(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.pre, builder)
}

public func Ul(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.ul, builder)
}

public func A(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.a, builder)
}

public func Abbr(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.abbr, builder)
}

public func B(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.b, builder)
}

public func Bdi(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.bdi, builder)
}

public func Bdo(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.bdo, builder)
}

public func Br(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.br, builder)
}

public func Cite(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.cite, builder)
}

public func Code(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.code, builder)
}

public func Data(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.data, builder)
}

public func Dfn(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.dfn, builder)
}

public func Em(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.em, builder)
}

public func I(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.i, builder)
}

public func Kbd(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.kbd, builder)
}

public func Mark(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.mark, builder)
}

public func Q(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.q, builder)
}

public func Ruby(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.ruby, builder)
}

public func S(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.s, builder)
}

public func Samp(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.samp, builder)
}

public func Small(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.small, builder)
}

public func Span(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.span, builder)
}

public func Strong(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.strong, builder)
}

public func Sub(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.sub, builder)
}

public func Sup(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.sup, builder)
}

public func Time(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.time, builder)
}

public func U(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.u, builder)
}

public func Var(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.var, builder)
}

public func Wbr(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.wbr, builder)
}

public func Area(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.area, builder)
}

public func Audio(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.html, builder)
}

public func Img(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.img, builder)
}

public func Map(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.map, builder)
}

public func Track(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.track, builder)
}

public func Video(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.video, builder)
}

public func Embed(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.embed, builder)
}

public func Iframe(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.iframe, builder)
}

public func Object(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.object, builder)
}

public func Param(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.param, builder)
}

public func Picture(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.picture, builder)
}

public func Portal(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.portal, builder)
}

public func Source(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.source, builder)
}

public func Svg(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.svg, builder)
}

public func Math(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.math, builder)
}

public func Canvas(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.canvas, builder)
}

public func Noscript(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.noscript, builder)
}

public func Script(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.script, builder)
}

public func Del(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.del, builder)
}

public func Ins(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.ins, builder)
}

public func Caption(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.caption, builder)
}

public func Col(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.col, builder)
}

public func Colgroup(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.colgroup, builder)
}

public func Table(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.table, builder)
}

public func Tbody(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.tbody, builder)
}

public func Td(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.td, builder)
}

public func Tfoot(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.tfoot, builder)
}

public func Th(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.th, builder)
}

public func Thead(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.thead, builder)
}

public func Tr(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.tr, builder)
}

public func Button(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.button, builder)
}

public func Datalist(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.datalist, builder)
}

public func Fieldset(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.fieldset, builder)
}

public func Form(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.form, builder)
}

public func Input(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.input, builder)
}

public func Label(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.label, builder)
}

public func Legend(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.legend, builder)
}

public func Meter(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.meter, builder)
}

public func Optgroup(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.optgroup, builder)
}

public func Option(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.option, builder)
}

public func Output(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.output, builder)
}

public func Progress(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.progress, builder)
}

public func Select(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.select, builder)
}

public func Textarea(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.textarea, builder)
}

public func Details(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.details, builder)
}

public func Dialog(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.dialog, builder)
}

public func Menu(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.menu, builder)
}

public func Summary(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.summary, builder)
}

public func Slot(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.slot, builder)
}

public func Template(@ChildBuilder<SelectorChild> _ builder: () -> [SelectorChild]) -> Selector {
    Element(.template, builder)
}
