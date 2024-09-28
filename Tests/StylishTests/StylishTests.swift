//
//  SwiftCssTests.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 11..
//

import XCTest
@testable import Stylish

final class StylishTests: XCTestCase {
    
    func testMinifiedStylesheet() {
        let css = Stylesheet(charset: "UTF-8") {
            Media {
                Root {
                    Margin(vertical: .px(8.5), horizontal: .px(8))
                    Padding(vertical: .px(8), horizontal: .px(8))
                }
            }
        }
        let rendered = css.render(configuration: .init(minify: true, indent: 2))
        print(rendered)
        XCTAssertEqual(rendered, #"@charset "UTF-8";:root{margin:8.5px 8px;padding:8px 8px}"#)
    }
    
    func testCustomIndentStylesheet() {
        let css = Stylesheet(charset: "UTF-8") {
            Media {
                Root {
                    Margin(vertical: .px(8.5), horizontal: .px(8))
                    Padding(vertical: .px(8), horizontal: .px(8))
                }
            }
        }
        let rendered = css.render(configuration: .init(indent: 2))
        print(rendered)
        XCTAssertEqual(rendered, #"""
                               @charset "UTF-8";
                               :root {
                                 margin: 8.5px 8px;
                                 padding: 8px 8px;
                               }
                               """#)
    }

    func testStylesheetWithoutMedia() {
        let css = Stylesheet {
            Id("test") {
                FontFamily(.family("sans-serif"))
            }
        }
        let rendered = css.render(configuration: .init(indent: 2))
        print(rendered)
        XCTAssertEqual(rendered, #"""
                               #test {
                                 font-family: sans-serif;
                               }
                               """#)
    }

    func testFontFace() {
        let css = Stylesheet {
            FontFace {
                FontFamily("SuperFont")
                Property(name: "src", value: "url(SuperFont.woff2) format('woff2')")
            }
            Media(screen: .xs) {
                FontFace {
                    FontFamily("SuperFont")
                    FontSize(12.px)
                    Property(name: "src", value: "url(SuperFont-Bold.woff2) format('woff2')")
                }
            }
        }
        let rendered = css.render(configuration: .init(indent: 2))
        print(rendered)
        XCTAssertEqual(rendered, #"""
                               @font-face {
                                 font-family: SuperFont;
                                 src: url(SuperFont.woff2) format('woff2');
                               }
                               @media screen and (max-width: 599px) {
                                 @font-face {
                                   font-family: SuperFont;
                                   font-size: 12px;
                                   src: url(SuperFont-Bold.woff2) format('woff2');
                                 }
                               }
                               """#)
    }

    func testMergingStylesheets() {
        let stylesheet1 = Stylesheet {
            Id("test") {
                FontFamily(.family("sans-serif"))
            }
        }
        let stylesheet2 = Stylesheet {
            Element(.body) {
                FontWeight(.bold)
            }
        }
        let combined = Stylesheet(merging: [stylesheet1, stylesheet2])
        let rendered = combined.render(configuration: .init(indent: 2))
        print(rendered)
        XCTAssertEqual(rendered, #"""
                               #test {
                                 font-family: sans-serif;
                               }
                               body {
                                 font-weight: bold;
                               }
                               """#)
    }

    func testStylesheet() {
        let css = Stylesheet(charset: "UTF-8") {
            
            Element(.a) {
                TextDecorationLine(.underline)
                Element(.p) {
                    Color(.black)
                }
            }.pseudo(.hover)

            Root {
                Margin(vertical: .px(8.5), horizontal: .px(8))
                Padding(vertical: .px(8), horizontal: .px(8))
            }

            Media(screen: .s) {
                Class("button") {
                    Color("#cafe00")
                    Element(.span) {
                        FontWeight(.bold)
                        Element(.p) {
                            Color("#000")
                        }
                    }
                }
            }
            
            Media(screen: .dark) {
                All {
                    Margin(vertical: .px(8), horizontal: .px(8))
                }
            }
            
            Media(screen: .standalone) {
                Id("lead") {
                    Background(.color(.red))
                }
            }
        }
        
        let rendered = css.render()
        print(rendered)
        XCTAssertEqual(rendered, #"""
                               @charset "UTF-8";
                               a:hover {
                                   text-decoration-line: underline;
                               }
                               a:hover p {
                                   color: black;
                               }
                               :root {
                                   margin: 8.5px 8px;
                                   padding: 8px 8px;
                               }
                               @media screen and (min-width: 600px) {
                                   .button {
                                       color: #cafe00;
                                   }
                                   .button span {
                                       font-weight: bold;
                                   }
                                   .button span p {
                                       color: #000;
                                   }
                               }
                               @media screen and (prefers-color-scheme: dark) {
                                   * {
                                       margin: 8px 8px;
                                   }
                               }
                               @media screen and (display-mode: standalone) {
                                   #lead {
                                       background: red;
                                   }
                               }
                               """#)
    }
    
    func testVariable() {
        let css = Stylesheet {
            Media {
                Root {
                    Variable("size", "400px")
                }
                
                Selector(".container") {
                    Width("var(--size)")
                }
            }
            Media(screen: .xs) {
                Root {
                    Variable("size", "200px")
                }
            }
            Media(screen: .dark) {
                Root {
                    Variable("size", "500px")
                }
            }
            Media(screen: .standalone) {
                Root {
                    Variable("size", "460px")
                }
            }
        }

        let rendered = css.render()
        print(rendered)
        XCTAssertEqual(rendered, #"""
                               :root {
                                   --size: 400px;
                               }
                               .container {
                                   width: var(--size);
                               }
                               @media screen and (max-width: 599px) {
                                   :root {
                                       --size: 200px;
                                   }
                               }
                               @media screen and (prefers-color-scheme: dark) {
                                   :root {
                                       --size: 500px;
                                   }
                               }
                               @media screen and (display-mode: standalone) {
                                   :root {
                                       --size: 460px;
                                   }
                               }
                               """#)
    }
    
    func testMediaQueries() {
        let css = Stylesheet {
            Media {
                Root {
                    Background(.color(.red))
                }
            }
            Media(screen: .xs) {
                Root {
                    Background(.color(.blue))
                }
            }
            Media(screen: .dark) {
                Root {
                    Background(.color(.green))
                }
            }
            Media(screen: .standalone) {
                Body {
                    Background(.color(.yellow))
                }
            }
        }

        let rendered = css.render()
        print(rendered)
        XCTAssertEqual(rendered, #"""
                               :root {
                                   background: red;
                               }
                               @media screen and (max-width: 599px) {
                                   :root {
                                       background: blue;
                                   }
                               }
                               @media screen and (prefers-color-scheme: dark) {
                                   :root {
                                       background: green;
                                   }
                               }
                               @media screen and (display-mode: standalone) {
                                   body {
                                       background: yellow;
                                   }
                               }
                               """#)
    }
}


