# Stylish

A Swift CSS DSL library, based on [swift-css]("https://github.com/BinaryBirds/swift-css").

```swift
let css = Stylesheet {            
    All {
        Background("#222")
    }
    Element(.div) {
        Color(.white)
        TextAlign(.left)
        Element(.p) {
            FontWeight(.bold)
        }
        Child {
            Element(.span) {
                BackgroundColor(.gray)
            }
        }
    }
    Element(.input) {
        Pseudo(.focus) {
            BackgroundColor(.red)
        }
    }
    Media("only screen and (max-width: 600px)") {
        Id("custom-identifier") {
            Background("#222")
            Color(.cyan)
        }
        Class("custom-class") {
            Background("#333")
            Color(.aliceBlue)
        }
        Selector("ul > li > a") {
            Background("black")
            Color(.red)
                .important()
        }
        .pseudo(.hover)
    }
}
    
print(css.render())
```

## Credits & references

- [The original SwiftCss library by BinaryBirds](https://github.com/BinaryBirds/swift-css)
- [W3: Cascading Style Sheets](https://www.w3.org/Style/CSS/)
- [MDN CSS Documentation](https://developer.mozilla.org/en-US/docs/Web/CSS)
