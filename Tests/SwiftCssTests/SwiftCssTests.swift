//
//  SwiftCssTests.swift
//  SwiftCss
//
//  Created by Tibor Bodecs on 2021. 07. 11..
//

import XCTest
@testable import SwiftCss

final class SwiftCssTests: XCTestCase {
    
    func testMinifiedStylesheet() {
        let css = Stylesheet {
            Charset("UTF-8")
            Media {
                Root {
                    Margin(vertical: .px(8.5), horizontal: .px(8))
                    Padding(vertical: .px(8), horizontal: .px(8))
                }
            }
        }
        XCTAssertEqual(StylesheetRenderer(minify: true, indent: 2).render(css), #"@charset "UTF-8";:root{margin:8.5px 8px;padding:8px 8px}"#)
    }
    
    func testCustomIndentStylesheet() {
        let css = Stylesheet {
            Charset("UTF-8")
            Media {
                Root {
                    Margin(vertical: .px(8.5), horizontal: .px(8))
                    Padding(vertical: .px(8), horizontal: .px(8))
                }
            }
        }
        print(StylesheetRenderer(indent: 2).render(css))
        XCTAssertEqual(StylesheetRenderer(indent: 2).render(css), #"""
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
        print(StylesheetRenderer(indent: 2).render(css))
        XCTAssertEqual(StylesheetRenderer(indent: 2).render(css), #"""
                               #test {
                                 font-family: sans-serif;
                               }
                               """#)
    }

    func testStylesheet() {
        let css = Stylesheet {
            Charset("UTF-8")

            Media {
                Root {
                    Margin(vertical: .px(8.5), horizontal: .px(8))
                    Padding(vertical: .px(8), horizontal: .px(8))
                }
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
            Media(screen: .dark, {
                All {
                    Margin(vertical: .px(8), horizontal: .px(8))
                }
            })
            Media(screen: .standalone) {
                Id("lead") {
                    Background(.color(.red))
                }
            }
        }
        
        XCTAssertEqual(StylesheetRenderer().render(css), #"""
                               @charset "UTF-8";
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

        XCTAssertEqual(StylesheetRenderer().render(css), #"""
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

        XCTAssertEqual(StylesheetRenderer().render(css), #"""
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


